# README DB 設計

## users table

| Column          | Type   | Options     |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |


### Association

- has_many :items

## items table

| Column    | Type           | Options                        |
|-----------|----------------|--------------------------------|
| user      | references     | null: false, foreign_key: true |
| image     | active_storage | null: false                    |
| title     | string         | null: false                    |
| text      | string         | null: false                    |
| price     | integer        | null: false                    |
| category  | string         | null: false                    |
| status    | string         | null: false                    |
| cost      | string         | null: false                    |
| place     | string         | null: false                    |
| take_time | string         | null: false                    |
| orders    | references     |                                |

### Association

- belongs_to :users
- belongs_to :order

## orders table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| item            | references | null: false, foreign_key: true |
| shipping_info   | references | null: false, foreign_key: true |
| card_number     | integer    | null: false                    |
| expiration_date | date       | null: false                    |
| security_code   | integer    | null: false                    |

### Association

- belongs_to :item
- belongs_to :shipping_info

## shipping_info table

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| orders       | references | null: false, foreign_key: true |
| post_cord    | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| Building     | string     | null: false                    |
| phone_number | integer    | null: false                    |

### Association

- belongs_to :order