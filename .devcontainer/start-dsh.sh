#!/usr/bin/env bash
set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v dsh >/dev/null 2>&1; then
  npm config set allow-scripts=@deepseek-ai/dsh-subprocess-local,koffi,node-pty,@google/genai,protobufjs --location=user
  npm install -g @deepseek-ai/dsh
fi

if [ -n "${CODESPACE_NAME:-}" ]; then
  PUBLIC_URL="https://${CODESPACE_NAME}-3080.app.github.dev/"
else
  PUBLIC_URL="http://127.0.0.1:3080/"
fi

rm -f /tmp/dsh.log
nohup dsh web --no-open --public-url "$PUBLIC_URL" > /tmp/dsh.log 2>&1 &
DSH_PID=$!

for i in $(seq 1 90); do
  if grep -q "dsh web:" /tmp/dsh.log 2>/dev/null; then
    break
  fi
  sleep 1
done

PORT=3081 DSH_LOG=/tmp/dsh.log nohup node "${SCRIPT_DIR}/dsh-redirect.js" > /tmp/dsh-redirect.log 2>&1 &

echo "DSH started (pid ${DSH_PID}). Redirector on port 3081."
