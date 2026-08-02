# OpenCode devcontainer 実験環境

devcontainer内でOpenCodeを動かし、ホスト（Mac）で起動中のvllm-mlxモデルサーバーに接続する実験用構成。

## 構成

```
.devcontainer/
├── devcontainer.json   # devcontainer定義
├── Dockerfile          # Node 22 + opencode-ai
├── post-create.sh      # 設定配置と疎通確認
└── opencode.json       # ホストのモデルサーバーを指すprovider設定
```

## 使い方

1. ホスト側でモデルサーバーを起動しておく:

```bash
source ~/work/OpenCode/mlx-env/bin/activate
vllm-mlx serve ~/models/gemma-4-12b-it-mlx-8bit \
  --port 8000 \
  --enable-auto-tool-choice \
  --tool-call-parser gemma4 \
  --reasoning-parser gemma4 \
  --default-chat-template-kwargs '{"enable_thinking": false}'
```

2. このフォルダをVS Code / Cursorで開き、「Reopen in Container」を実行

3. コンテナ内ターミナルで:

```bash
opencode
```

`/models` で `local-gemma` を選択して使う。

## 注意

- `.devcontainer/Dockerfile` の `OPENCODE_VERSION` は既定で `latest`。
  実験の再現性が必要なら固定バージョンに変更する（例: `1.18.3`）。
  ※コンテナ内のnpmはホストのsafe-chainの保護対象外である点に留意。
- `opencode.json` の `models` キーはホスト側のモデルパスと完全一致させること。
- サーバーを `--api-key` 付きで起動した場合は `opencode.json` の `apiKey` を合わせる。
- コンテナ自体もDockerのメモリ割り当てを消費する。モデル用の空きメモリとの兼ね合いに注意。
