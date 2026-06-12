#!/bin/zsh
# 香の天文台 ─ 公開更新スクリプト
# アトリエの原本 observatory.html を index.html にコピーして、コミット＆プッシュする。
# （OGPメタは原本側にも入っているので、コピーだけで公開準備が整う）

cd "$(dirname "$0")" || exit 1

cp "../observatory.html" "index.html" || { echo "原本が見つかりません"; exit 1; }

git add -A
if git diff --cached --quiet; then
  echo "変更はありません（原本と公開版は同じです）"
else
  git commit -m "update: 観測室を最新版に更新 $(date '+%Y-%m-%d %H:%M')"
  git push origin main && echo "公開しました → https://sousuyou.github.io/observatorium/（反映まで1分ほど）"
fi

read -k 1 "?何かキーを押すと閉じます..."
