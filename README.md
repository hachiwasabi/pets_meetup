# Pets Meetup
## サイト概要

### サイトテーマ
可愛いペットの可愛い写真を自慢し合う、コミュニティサイト 
​
### テーマを選んだ理由
自分自身動物が好きで、現在うさぎを２匹飼っています。日々の可愛いところをもっと自慢したいと頭を悩ませていました。  
そこでペット特化型の画像や動画を投稿できるサービスがあれば便利だと考えました。  
また動物特有の仕草などで不明なことを相談できるコミュニティがあると便利だと思いました。  
当問題を解決するために、このようなポートフォリオを制作してみようと考えました。  
​
### ターゲットユーザ
- ペットを飼っており、たくさんの人に見てほしいと考えている人。  
- 動物が好きで、色んな写真が見たい人。  
​
### 主な利用シーン
- 可愛いペットの写真が撮れた時  
- 動物の仕草でわからないことがあった時  
- 可愛い動物の写真を見たい時  
​
## 設計書
- ER図  
 https://app.diagrams.net/#G1sJ7e_K3hCkbwlYSEYlj9xeRMqFBUE9xn#%7B%22pageId%22%3A%22HrGRWtzS3Ohiksi3GOJG%22%7D
- UIFlows  
 https://app.diagrams.net/?splash=0#G1YFSdg8DKD4Sqa7iETs-TkZB-Um1EFx_m#%7B%22pageId%22%3A%22Pnn4z04QS0yQXpXC0SX-%22%7D
- テーブル定義書 https://docs.google.com/spreadsheets/d/1sYBeQpitBQRf6SLJLUtOySqiPxpvdbmBbFwuZbV7ORA/edit?gid=977686452#gid=977686452
- アプリケーション詳細設計書 https://docs.google.com/spreadsheets/d/1zWoYmU13L2TyNGK7n73wzGzokSb8UoudJaaPtKhW_RM/edit?gid=549108681#gid=549108681
​
### 機能一覧
- ユーザー登録、ログイン/ログアウト（Devise）
- 投稿機能（複数画像対応）
- 投稿へのコメント機能
- いいね機能（非同期通信）
- グループ機能（チャット機能あり）
- ユーザー・投稿検索機能
- 管理者機能（投稿削除、ユーザー管理、コメント管理、グループ管理）
- AI

## 開発環境
- OS：Windows
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Visual Studio Code（VSCode）
​
## 使用素材
- Canva様（ロゴ）https://www.canva.com/  
- Unsplash+様（aboutページ画像、プロフィール画像、投稿画像）https://unsplash.com/ja