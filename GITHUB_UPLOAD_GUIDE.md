# GitHubにアップロードする手順

このリポジトリを自分のGitHubアカウントで公開する方法を説明します。

## 📋 前提条件

- GitHubアカウントを持っていること
- Gitがインストールされていること
- このリポジトリがクローン済みであること

## 🚀 手順

### 方法1: スクリプトを使用する（推奨）

1. **GitHubで新しいリポジトリを作成**
   - https://github.com/new にアクセス
   - リポジトリ名: `agent-book` (または任意の名前)
   - Public または Private を選択
   - ⚠️ **README、.gitignore、ライセンスは追加しない**（既存のファイルを使用します）

2. **スクリプトを実行**
   ```bash
   cd agent-book
   ./upload_to_github.sh YOUR_GITHUB_USERNAME
   ```

### 方法2: 手動で実行する

1. **GitHubで新しいリポジトリを作成**
   - https://github.com/new にアクセス
   - リポジトリ名を入力
   - Public または Private を選択
   - README、.gitignore、ライセンスは追加しない

2. **リモートURLを変更**
   ```bash
   cd agent-book
   git remote set-url origin https://github.com/YOUR_USERNAME/REPO_NAME.git
   ```

3. **リモート設定を確認**
   ```bash
   git remote -v
   ```

4. **プッシュ**
   ```bash
   git push -u origin main
   ```

## ⚠️ 注意事項

- このリポジトリは元々 [minorun365/agent-book](https://github.com/minorun365/agent-book) からクローンされたものです
- MITライセンスが適用されています
- 元のリポジトリへのクレジットを保持してください
- 変更を加える場合は、フォークとして管理することを検討してください

## 🔄 既存のリポジトリと同期する場合

元のリポジトリ（minorun365/agent-book）から最新の変更を取得したい場合：

```bash
# 元のリポジトリを upstream として追加
git remote add upstream https://github.com/minorun365/agent-book.git

# 最新の変更を取得
git fetch upstream

# マージ
git merge upstream/main
```

## 📝 トラブルシューティング

### 認証エラーが発生する場合

HTTPSを使用している場合、GitHubのPersonal Access Tokenが必要な場合があります：
1. https://github.com/settings/tokens でトークンを生成
2. パスワードの代わりにトークンを使用

または、SSHを使用する場合：
```bash
git remote set-url origin git@github.com:YOUR_USERNAME/REPO_NAME.git
```

### プッシュが拒否される場合

既存のリポジトリにREADME等が含まれている場合：
```bash
git pull origin main --allow-unrelated-histories
git push -u origin main
```

