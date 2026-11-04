# my-dsh

Run DeepSeek Harness (DSH) in GitHub Codespaces.

## Open in Codespaces

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/dzerok2020/my-dsh)

## How it works

1. Create a Codespace from this repo (click badge above).
2. The container installs `@deepseek-ai/dsh` and starts it automatically.
3. Codespaces opens **port 3081** in your browser automatically.
   That page redirects to the DSH Web UI (with the required token).
4. Add your DeepSeek API key as a Codespace secret named `DEEPSEEK_API_KEY`
   (GitHub Settings → Codespaces → Secrets) before creating the Codespace,
   or set it in the Codespace terminal.

Workspace lives in the Codespace (cloud).
