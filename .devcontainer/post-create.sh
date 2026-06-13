#!/usr/bin/env bash
set -u

cabal update || true

vsix=/opt/language-haskell.vsix
ext_id=justusadam.language-haskell

if [ ! -f "$vsix" ]; then
  echo "WARN: $vsix not found; cannot install the Haskell syntax grammar."
  exit 0
fi

server_cli="$(ls -t \
  "$HOME"/.vscode-server/bin/*/bin/code-server \
  "$HOME"/.vscode-server/cli/servers/*/server/bin/code-server \
  2>/dev/null | head -1 || true)"

manual_hint="Install it manually: Command Palette -> 'Extensions: Install from VSIX' -> $vsix, then reload the window."

if [ -z "$server_cli" ]; then
  echo "WARN: VS Code server CLI (code-server) not found. $manual_hint"
  exit 0
fi

echo "Using VS Code server CLI: $server_cli"
"$server_cli" --install-extension "$vsix" --force || true

if "$server_cli" --list-extensions 2>/dev/null | grep -qi "$ext_id"; then
  echo "Installed Haskell syntax grammar ($ext_id). Run 'Developer: Reload Window' if colours don't appear."
else
  echo "WARN: auto-install of $vsix did not take. $manual_hint"
fi
