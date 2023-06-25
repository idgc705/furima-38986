# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association
* has_many :items
* has_many :orders


## items table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| name               | string              | null: false                    |
| explanation        | text                | null: false                    |
| category_id        | integer             | null: false                    |
| condition_id       | integer             | null: false                    |
| shipping_cost_id   | integer             | null: false                    |
| prefecture_id      | integer             | null: false                    |
| shipping_time_id   | integer             | null: false                    |
| price              | integer             | null: false                    |
| user               | references          | null: false, foreign_key: true |

### Association
* belongs_to :user
* has_one :order

## orders table
| Column             | Type                | Options                           |
|--------------------|---------------------|-----------------------------------|
| user               | references          | null: false, foreign_key: true    |
| item               | references          | null: false, foreign_key: true    |

### Association
* belongs_to :user
* belongs_to :item
* has_one :deliver_addresses

## deliver_addresses table

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| order              | references          | null: false, foreign_key: true  |
| postcode           | string              | null: false                     |
| prefecture_id      | integer             | null: false                     |
| city               | string              | null: false                     |
| block              | string              | null: false                     |
| building           | string              |                                 |
| phone_number       | string              | null: false                     |

### Association
* belongs_to :order