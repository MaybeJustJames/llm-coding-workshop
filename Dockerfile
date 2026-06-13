# A general-purpose Haskell development environment.

FROM debian:bookworm-slim

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=1000

ARG GHC_VERSION=9.6.7

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    ca-certificates \
    git \
    gnupg \
    pkg-config \
    libffi-dev \
    libgmp-dev \
    libncurses-dev \
    libnuma-dev \
    zlib1g-dev \
    xz-utils \
    unzip \
    bat \
    fd-find \
    wget \
    less \
    vim \
    nano \
    jq \
    ripgrep \
    tmux \
    openssh-client \
    procps \
    sudo \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/batcat /usr/local/bin/bat \
    && ln -s /usr/bin/fdfind /usr/local/bin/fd

# --- Haskell toolchain via ghcup ---
ENV PATH="/root/.ghcup/bin:${PATH}"

RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org \
    | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_MINIMAL=1 sh \
    && ghcup install ghc "${GHC_VERSION}" --set \
    && ghcup install cabal --set \
    && ghcup install hls --set \
    && ghc --version \
    && cabal --version \
    && haskell-language-server-wrapper --version

# --- Node.js 22 ---

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/* \
    && node --version && npm --version

# --- Pi coding agent ---

RUN curl -fsSL https://pi.dev/install.sh | sh \
    && pi --version \
    && rm -rf /root/.pi

# --- Haskell tools ---

RUN cabal update \
    && cabal install --install-method=copy --overwrite-policy=always \
       --installdir=/usr/local/bin \
       hlint fourmolu hoogle \
    && hlint --version \
    && fourmolu --version \
    && hoogle --version \
    && rm -rf /root/.cabal/store /root/.cabal/packages /root/.cabal/logs \
              /root/.cache/cabal /root/.local/state/cabal

# --- VS Code Haskell syntax grammar (offline) ---
ARG LANGUAGE_HASKELL_VERSION=3.6.0
RUN curl -fsSL -o /opt/language-haskell.vsix \
    "https://open-vsx.org/api/justusadam/language-haskell/${LANGUAGE_HASKELL_VERSION}/file/justusadam.language-haskell-${LANGUAGE_HASKELL_VERSION}.vsix"

# --- Non-root user ---

RUN set -eux; \
    if ! getent group "${USER_GID}" >/dev/null; then \
        groupadd --gid "${USER_GID}" "${USERNAME}"; \
    fi; \
    if getent passwd "${USER_UID}" >/dev/null; then \
        EXISTING="$(getent passwd "${USER_UID}" | cut -d: -f1)"; \
        usermod --login "${USERNAME}" --home "/home/${USERNAME}" --move-home "${EXISTING}"; \
        usermod --gid "${USER_GID}" --shell /bin/bash "${USERNAME}"; \
    else \
        useradd --uid "${USER_UID}" --gid "${USER_GID}" --create-home --shell /bin/bash "${USERNAME}"; \
    fi; \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/"${USERNAME}"; \
    chmod 0440 /etc/sudoers.d/"${USERNAME}"; \
    chmod 0755 /root; \
    git config --system --add safe.directory /workspace

ENV HOME="/home/${USERNAME}" \
    PATH="/root/.ghcup/bin:/home/${USERNAME}/.cabal/bin:/home/${USERNAME}/.local/bin:${PATH}"

RUN printf '%s\n' \
    'export PATH="/root/.ghcup/bin:$HOME/.cabal/bin:$HOME/.local/bin:$PATH"' \
    > /etc/profile.d/10-haskell-pi.sh

# --- Workspace ---

USER ${USERNAME}
WORKDIR /workspace

RUN pi install git:github.com/ghoseb/pi-askuserquestion \
    || echo "WARN: 'pi install ask_user_question' failed; re-run it inside the container."

RUN hoogle generate \
    || echo "WARN: 'hoogle generate' failed; re-run it inside the container."

CMD ["bash"]
