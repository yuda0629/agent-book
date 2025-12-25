#!/bin/bash

# GitHubにアップロードするためのスクリプト
# 使用方法: ./upload_to_github.sh YOUR_GITHUB_USERNAME

if [ -z "$1" ]; then
    echo "エラー: GitHubユーザー名を指定してください"
    echo "使用方法: ./upload_to_github.sh YOUR_GITHUB_USERNAME"
    exit 1
fi

GITHUB_USERNAME=$1
REPO_NAME="agent-book"

echo "========================================="
echo "GitHubリポジトリにアップロードする準備"
echo "========================================="
echo ""
echo "⚠️  事前に以下を完了してください："
echo "1. GitHubで新しいリポジトリを作成: https://github.com/new"
echo "2. リポジトリ名: $REPO_NAME (または任意の名前)"
echo "3. Public または Private を選択"
echo "4. README、.gitignore、ライセンスは追加しない"
echo ""
read -p "GitHubリポジトリを作成しましたか？ (y/n): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "キャンセルしました。GitHubリポジトリを作成してから再度実行してください。"
    exit 1
fi

echo ""
echo "リモートURLを変更します..."
git remote set-url origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git

echo "現在のリモート設定:"
git remote -v

echo ""
echo "プッシュを実行しますか？"
read -p "実行しますか？ (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "プッシュを実行中..."
    git push -u origin main
    echo ""
    echo "✅ 完了！"
    echo "リポジトリURL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
else
    echo "キャンセルしました。"
    echo "手動でプッシュする場合: git push -u origin main"
fi

