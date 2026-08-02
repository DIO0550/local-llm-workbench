# Node LTS ベースの devcontainer 公式イメージ（vscode ユーザー同梱）
FROM mcr.microsoft.com/devcontainers/javascript-node:22

# curl は疎通確認に使う（ベースイメージに含まれるが明示）
RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

USER node


# OpenCode をグローバルインストール
# バージョンは実験の再現性のため固定する（必要に応じて更新）
RUN curl -fsSL https://opencode.ai/install | bash