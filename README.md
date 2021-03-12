# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :fix_users
- has_many :fixes, through: fix_users
- has_many :messages
- has_one  :profiles

## fixes テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| title   | string | null: false |
| comment | string |

### Association

- has_many :fix_users
- has_many :users, through: fix_users
- has_many :messages
- has_many :profiles

## fix_users テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| retouch | references | null: false, foreign_key: true |
|  user   | references | null: false, foreign_key: true |

### Association

- belongs_to :retouch
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| retouch | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :fix
- belongs_to :user
- has_one_attached :image

## profiles テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| nickname     | string     |                                |
| genre_id     | integer    |                                |
| age_id       | integer    |                                |
| introduction | text       |                                |
| retouch      | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :fix
- belongs_to :user