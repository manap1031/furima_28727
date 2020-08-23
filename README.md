# README

## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password-1      | string  | null: false |
| password-2      | string  | null: false |
| first-name      | string  | null: false |
| last-name       | string  | null: false |
| first-name-kana | string  | null: false |
| last-name-kana  | string  | null: false |
| birth-year      | integer | null: false |
| birth-month     | integer | null: false |
| birth-day       | integer | null: false |

## association
- has_many: exhibitions
- has_one: payments


## exhibitionsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | string     | null: false                    |
| item-name       | string     | null: false                    |
| describe        | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shippong-charge | string     | null: false                    |
| shipping-area   | string     | null: false                    |
| shipping-day    | string     | null: false                    |
| price           | integer    | null: false                    |
| users_id        | references | null: fales, foreign_key: treu |

## association
- has_one: users
- has_one: payments


## paymentsテーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| card-number     | integer     | null: false                    |
| card-month      | integer     | null: false                    |
| card-year       | integer     | null: false                    |
| secyrity-code   | integer     | null: false                    |
| postal-code     | integer     | null: false                    |
| prefectures     | string      | null: false                    |
| municipalities  | string      | null: false                    |
| building        | string      | null: false                    |
| phone-numbe     | integer     | null: false                    |
| exhibitions     | references  | null: fales, foreign_key: treu |
| user_id         | references  | null: fales, foreign_key: treu |

## association
has_one: users
has_one: exhibitions
