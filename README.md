# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :fixes
- has_many :room_users
- has_many :room, through: room_users
- has_many :message
- has_one  :profiles

## fixes テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| comment  | text       | null: false                    |
| genre_id | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :room
- has_one_attached :image

## rooms テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|  name   | string     | null: false                    |
|  fixes  | references | null: false, foreign_key: true |

### Association

- belongs_to :fix
- has_many   :room_users
- has_many   :user, through: room_users
- has_many   :message

## room_users テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|  room   | references | null: false, foreign_key: true |
|  user   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| room    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- has_many :fixes
- has_many :users
- has_one_attached :image

## profiles テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| genre_id     | integer    |                                |
| age_id       | integer    |                                |
| introduction | text       |                                |
| user         | references | null: false, foreign_key: true |

### Association

- has_one :user
- has_one_attached :image