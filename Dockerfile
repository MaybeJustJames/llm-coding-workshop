# Use the official Haskell image
FROM haskell:9-slim

# Install system dependencies required for HLS and other tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libffi-dev \
    libgmp-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Install ghcup non-interactively
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 sh

# Add ghcup to PATH so that ghc, cabal, and hls are accessible
ENV PATH="/root/.ghcup/bin:${PATH}"

# Install HLS via ghcup
RUN ghcup install hls --set

# Set the working directory
WORKDIR /workspace
