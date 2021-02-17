# README DB 設計

## users table

| Column             | Type       | Options                        |
|--------------------|------------ |-------------------------------|
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| birthday           | date       | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| orders             | references | null: false, foreign_key: true |


### Association

- has_many :items
- has_many :orders

## items table

| Column     | Type           | Options                        |
|------------|----------------|--------------------------------|
| user       | references     | null: false, foreign_key: true |
| title      | string         | null: false                    |
| text       | string         | null: false                    |
| price      | integer        | null: false                    |
| category   | string         | null: false                    |
| status     | string         | null: false                    |
| cost       | string         | null: false                    |
| prefecture | string         | null: false                    |
| take_time  | string         | null: false                    |
| orders     | references     |                                |

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
- belongs_to :user
- belongs_to :shipping_info

## shipping_info table

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| order        | references | null: false, foreign_key: true |
| post_cord    | string     | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |

### Association

- belongs_to :order