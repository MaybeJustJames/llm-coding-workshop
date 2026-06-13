#!/usr/bin/env bash
# Runs once when the Dev Container is created (devcontainer.json postCreateCommand).
set -u

# Refresh the cabal package index.
cabal update || true

# Install the Haskell TextMate grammar (syntax highlighting). The extension
# justusadam.language-haskell was removed from the MS Marketplace, so it can't go
# in devcontainer.json "extensions"; instead the VSIX is baked into the image
# (see Dockerfile) and installed here via the VS Code Server CLI.
vsix=/opt/language-haskell.vsix

# Locate the VS Code Server CLI: it's usually on PATH as `code`, but fall back to
# globbing the server install if not (path contains a version/commit hash).
code_cli="$(command -v code || true)"
if [ -z "$code_cli" ]; then
  code_cli="$(ls "$HOME"/.vscode-server/bin/*/bin/remote-cli/code \
                 "$HOME"/.vscode-server/cli/servers/*/server/bin/remote-cli/code \
              2>/dev/null | head -1 || true)"
fi

if [ -n "$code_cli" ] && [ -f "$vsix" ]; then
  if "$code_cli" --install-extension "$vsix"; then
    echo "Installed Haskell syntax grammar from $vsix (reload the window if colours don't appear)."
  else
    echo "WARN: failed to install $vsix; install it manually via 'Extensions: Install from VSIX'."
  fi
else
  echo "WARN: VS Code CLI or $vsix not found; install $vsix manually via 'Extensions: Install from VSIX'."
fi
