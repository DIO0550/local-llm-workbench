# Node LTS ベースの devcontainer 公式イメージ（vscode ユーザー同梱）
FROM mcr.microsoft.com/devcontainers/javascript-node:22

# OpenCode をグローバルインストール
# バージョンは実験の再現性のため固定する（必要に応じて更新）
ARG OPENCODE_VERSION=latest
RUN npm install -g opencode-ai@${OPENCODE_VERSION}

# curl は疎通確認に使う（ベースイメージに含まれるが明示）
RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*
