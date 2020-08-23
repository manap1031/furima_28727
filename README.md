# README

## usersテーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmatio  | string  | null: false |
| first-name            | string  | null: false |
| last-name             | string  | null: false |
| first-name-kana       | string  | null: false |
| last-name-kana        | string  | null: false |
| birth-day             | date    | null: false |

## association
- has_many: exhibitions
- has_one : address
- has_one : payments


## exhibitionsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | string     | null: false                    |
| item-name          | string     | null: false                    |
| describe           | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shippong-charge_id | integer    | null: false                    |
| shipping-area_id   | integer    | null: false                    |
| shipping-day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| users              | references | null: fales, foreign_key: treu |

## association
- belongs_to: users
- has_one: address
- has_one: payment

## address

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postal-code     | string      | null: false                    |
| prefectures     | string      | null: false                    |
| municipalities  | string      | null: false                    |
| addres-number   | string      | mull: false                    |
| building        | string      |                                |
| phone-number    | string      | null: false                    |
| exhibitions     | references  | null: fales, foreign_key: treu |
| users           | references  | null: fales, foreign_key: treu |

## association
belongs_to: user
belongs_to: exhibition

