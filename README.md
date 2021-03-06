# illustratum

https://illustratum.herokuapp.com/

## 機能のご紹介

### アプリケーション概要 

- 初心者向けのSNS投稿型イラスト添削アプリです！
- 添削して欲しい画像を投稿すると、詳細ページよりコメント、画像の送信が掲示板形式 で表示されます！

### 制作背景

イラストのアプリは多数ありますが、ほぼ全て中級から上級者、あるいはプロ向けのアプリしかありません。イラストを描く上で早く成長に繋がるのは他者の目で見て意見をもらうことです。初心者がそういったところにイラストをアップするのはかなりハードルが高いです。
そこで初心者向けで更に添削に特化したアプリを作ろうと思いました。

### その他機能

- レスポンシブ対応
- 投稿編集/削除機能
- ログイン／ログアウト機能
- Rspec / factory_botによるテスト機能

## トップページ

[![Image from Gyazo](https://i.gyazo.com/7d59c3ccbf6e6bd59a999c848621eba7.gif)](https://gyazo.com/7d59c3ccbf6e6bd59a999c848621eba7)

## 投稿詳細ページ

[![Image from Gyazo](https://i.gyazo.com/808212e76a65c4f25aaa52141aac0e80.gif)](https://gyazo.com/808212e76a65c4f25aaa52141aac0e80)

## 投稿一覧ページ

[![Image from Gyazo](https://i.gyazo.com/433c44628a8186aadd5d822317e738d3.gif)](https://gyazo.com/433c44628a8186aadd5d822317e738d3)

## 今後の実装機能

- マイページ機能
- 画像ダウンロード機能
- 画像の拡大機能
- コメントの非同期通信
- 検索機能

### 使用技術（開発環境）

- 言語： HTML, CSS, Ruby, jQuery, JavaScript
- フレームワーク： Ruby on Rails
- DB： mysql
- サーバー: heroku

## データベース設計

### users テーブル

| Column       | Type     | Option      |
| ------------ | -------- | ------------|
| email        | string   | null: false |
| password     | string   | null: false |
| name         | string   | null: false |
| age_id       | interger |             |
| introduction | text     |             |
| position     | text     |             |

#### Association

- has_many :fixes
- has_many :messages
- has_one_attached :prof_image

### fixes テーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | -------------------------------|
| title      | string     | null: false                    |
| comment    | text       | null: false                    |
| genre_id   | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image
- has_many :messages, dependent: :destroy

### messagesテーブル

| Column    | Type        | Option                         |
| --------- | ----------- | -------------------------------|
| comment   | text        | null: false                    |
| user      | references  | null: false, foreign_key: true |
| fix       | references  | null: false, foreign_key: true |

### Association

- belongs_to :fix
- belongs_to :user
- has_one_attached :avatar

## テストコード

### 単体テスト


>モデル
>> [ユーザー機能](spec/models/user_spec.rb)   実装済み <br>
>> [リクエスト機能](spec/models/fix_spec.rb) 実装済み<br>
>> [コメント機能](spec/models/message_spec.rb)  実装済み

> コントローラー
>> リクエスト機能 実装途中<br>
>> コメント機能   実装途中

- 結合テスト

>> ユーザー機能  実装途中<br>
>> リクエスト機能 実装途中<br>
>> コメント機能  実装途中<br>

