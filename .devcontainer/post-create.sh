#!/usr/bin/env bash
set -euo pipefail

# OpenCode の設定をコンテナ内ユーザーに配置
mkdir -p "$HOME/.config/opencode"
cp .devcontainer/opencode.json "$HOME/.config/opencode/opencode.json"
echo "[post-create] opencode.json を配置しました"

# ホストのモデルサーバーへの疎通確認（失敗してもセットアップは続行）
echo "[post-create] ホストのモデルサーバーに疎通確認中..."
if curl -sf --max-time 5 http://host.docker.internal:8000/v1/models > /dev/null; then
  echo "[post-create] OK: host.docker.internal:8000 に到達できました"
else
  echo "[post-create] WARNING: モデルサーバーに到達できません。"
  echo "  ホスト側で vllm-mlx serve が起動しているか確認してください。"
  echo "  それでも繋がらない場合は --host 0.0.0.0 --api-key <key> で起動し直してください。"
fi

echo "[post-create] 完了。opencode コマンドで起動できます。"
