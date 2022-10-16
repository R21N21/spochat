# README

# アプリケーション名
spochat

# アプリケーション概要
サッカーファンが身近なファンだけではなく、面識のないファンともチャットで気軽に交流できるアプリです。

# URL
https://spochat.herokuapp.com/

# テスト用アカウント
basic認証ユーザー名 38391  
basic認証パスワード 1111  
メールアドレス test@test.com  
パスワード aaa111  

# 利用方法

## ユーザー管理機能
・spochatにアクセスすると初めにログインを促すようにしました。  
・ログインまたは新規登録をします。  
・ヘッダーの名前をクリックするとアカウント詳細ページへ遷移します。  
・詳細ページにはアカウント編集ボタンからニックネーム等の編集が可能です。  
・ログアウトを押すとログアウトができます。  

## チャットルーム管理機能
・ヘッダーのルーム作成ボタンからルーム作成ができます。  
・左側のサイドバーからチャットルームを選択できます。  
・チャットルーム内のチャットルーム削除ボタンでチャットルームの削除が行えます。  

## メッセージ送信機能
・チャットルームを選択し、下部のフォームからメッセージと画像の送信が行えます。  

# アプリケーションを作成した背景
サッカー観戦が趣味でよく友人とサッカーの話題で盛り上がりますが、身近な友人だけではなく、面識のないサッカーファンともチャットで気軽に交流できたら面白いと思い、チャットアプリを開発することにしました。

# 洗い出した要件
[要件定義をしたスプレッドシート](https://docs.google.com/spreadsheets/d/1tYsK3Ak5d2NHskY4ThXBPWRgOCVC5vKnjkkv4WiFtGE/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
[![Image from Gyazo](https://i.gyazo.com/8e2d9ce4de926959e2c7542d125fdf50.gif)](https://gyazo.com/8e2d9ce4de926959e2c7542d125fdf50)  
トップページ上部の名前からアカウント詳細ページへ遷移することができ、アカウント情報の編集ができます。  
  
[![Image from Gyazo](https://i.gyazo.com/329465df862fc3df7375b71e6bbda530.gif)](https://gyazo.com/329465df862fc3df7375b71e6bbda530)  
トップページヘッダーの「ルーム作成」を押すとルーム作成ページへ遷移し、チャット名、メンバーを選択することでチャットルームを作成できます。  
  
[![Image from Gyazo](https://i.gyazo.com/9aa6addecb9f517366dc1e5dbed9206c.gif)](https://gyazo.com/9aa6addecb9f517366dc1e5dbed9206c)  
チャットルーム下部のフォームよりメッセージと画像の投稿が行えます。  
メッセージ、画像どちらかが入力されていれば送信することができます。  
  
[![Image from Gyazo](https://i.gyazo.com/2091eb2a1cfb04cfdc14cc28f762c4cb.gif)](https://gyazo.com/2091eb2a1cfb04cfdc14cc28f762c4cb)  
チャットルーム内右上にある削除ボタンを押すことでチャットルームの削除が行えます。  

[![Image from Gyazo](https://i.gyazo.com/b1b990bee0023dd953a5f4e2e0cf4e9d.gif)](https://gyazo.com/b1b990bee0023dd953a5f4e2e0cf4e9d)  
ヘッダーのサッカーメディアをクリックすると情報サイトへのリンクのリストが表示されます。  
リンクをクリックすると情報サイトが別タブに表示されます。


# 実装予定の機能
・AWSのEC2でデプロイ  
・チャットルーム検索機能  
・チャットルームに複数人が入室できる  
・サッカーの試合日程等の表示  

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/f430c6047b20899b959fe683430167b1.png)](https://gyazo.com/f430c6047b20899b959fe683430167b1)  

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/f90af24ec87bde0269f714fec3089dfe.png)](https://gyazo.com/f90af24ec87bde0269f714fec3089dfe)  

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

# 使用技術

・使用言語、ツール  
サーバーサイド: Ruby,Ruby on Rails  
フロント: HTML,CSS,javascript  
データベース: MySQL  
コード管理: Github  
インフラ: Heroku,S3

# 工夫したポイント
・チャットページ、トップページからルーム作成ページ、アカウントページに遷移しやすいようにヘッダーに遷移できるボタンを用意しました。
・ヘッダーにサッカーの情報サイトへのリンクを用意しました。ヘッダーのサッカーメディアを押すとリストが表示されるようにjavascriptで実装しました。