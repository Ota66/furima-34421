# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| name          | string  | null: false |
| katakana_name | string  | null: false |
| birthday      | integer | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| image       | text       | null: false                    |
| item_name   | text       | null: false                    |
| description | text       | null: false                    |
| category    | text       | null: false                    |
| status      | text       | null: false                    |
| burden      | text       | null: false                    |
| area        | text       | null: false                    |
| day         | text       | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy

## buysテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belong_to :item
- has_one :shipping

## shippingsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | text       | null: false                    |
| municipality  | text       | null: false                    |
| house_number  | text       | null: false                    |
| building_name | text       |                                |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :buy


