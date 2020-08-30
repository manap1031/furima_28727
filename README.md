
## usersテーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| last_name_kana        | string  | null: false |
| birth_day             | date    | null: false |

### association
- has_many: exhibitions
- has_many: purchases


## exhibitionsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| describe           | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shippong_charge_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### association
- belongs_to: user
- has_many: images
- has_one:purchase


## imagesテーブル

| Column       | Type        | Options                        |
| -------------| ------------| ------------------------------ |
| image        | string      | null: false                    |
| exhibition   | references  | null: false, foreign_key: true |

### association
- belongs_to: exhibition


## address

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postal_code     | string      | null: false                    |
| prefectures_id  | integer     | null: false                    |
| municipalities  | string      | null: false                    |
| addres_number   | string      | null: false                    |
| building        | string      |                                |
| phone_number    | string      | null: false                    |
| purchase        | references  | null: false, foreign_key:true  |

### association
- belongs_to: purchase


## purchases

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| user            | references  | null: false, foreign_key: true |
| exhibition      | references  | null: false, foreign_key: true |

### association
- belongs_to: user
- belongs_to: exhibition
- has_one: address