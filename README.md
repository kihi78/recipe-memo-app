# レシピメモアプリ (Recipe Memo App)

## 概要

Ruby on Railsの学習の一環として作成したWebアプリケーションです。
個人の料理レシピを記録・管理するための、シンプルなメモアプリです。

## 主な機能

* レシピの一覧表示 (Read)
* レシピの新規投稿 (Create)
* レシピの編集 (Update)
* レシピの削除 (Delete)

## 使用技術

* **バックエンド:** Ruby 3.2.2, Ruby on Rails 7.1.5.1
* **データベース:** PostgreSQL
* **Webサーバー:** Puma
* **開発環境:** Docker, Docker Compose

## 実行環境の構築・起動方法

このアプリケーションをあなたのローカル環境で動かすための手順です。

### 前提条件

* DockerとDocker Composeがインストールされていること。

### 手順

1.  **リポジトリをクローン**
    ```bash
    git clone [https://github.com/kihi78/recipe-memo-app.git](https://github.com/kihi78/recipe-memo-app.git)
    ```

2.  **プロジェクトディレクトリに移動**
    ```bash
    cd recipe-memo-app
    ```

3.  **Dockerイメージをビルド**
    ```bash
    docker-compose build
    ```

4.  **アプリケーションを起動**
    以下のコマンドを実行すると、Webサーバーが起動します。このターミナルは起動したままにしておきます。
    ```bash
    docker-compose up
    ```

5.  **データベースの作成とテーブル作成**
    **別の新しいターミナル**を開き、このプロジェクトのディレクトリに移動してから、以下のコマンドを順番に実行します。
    ```bash
    # データベースを作成
    docker-compose exec app bin/rails db:create

    # テーブルを作成
    docker-compose exec app bin/rails db:migrate
    ```

6.  **ブラウザで確認**
    Webブラウザで以下のURLにアクセスしてください。
    [http://localhost:3000](http://localhost:3000) または [http://127.0.0.1:3000](http://127.0.0.1:3000)
