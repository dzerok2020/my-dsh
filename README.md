# my-dsh

Run DeepSeek Harness (DSH) in GitHub Codespaces for AI vibe coding.

## Open in Codespaces

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/dzerok2020/my-dsh)

## Setup

1. Add a Codespace secret named `DEEPSEEK_API_KEY` in your GitHub account settings
   (Settings → Codespaces → Secrets) with your DeepSeek API key.
2. Create a Codespace from this repo.
3. The container installs `@deepseek-ai/dsh` and starts `dsh web` on port 3080.
4. Open the forwarded port 3080 to use the DSH Web UI.

The workspace lives in the Codespace (cloud). For local-machine workspaces instead,
use a self-hosted GitHub Actions runner.
