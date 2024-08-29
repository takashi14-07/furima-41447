# README

# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nick_name          | string              | null: false               |
| email              | string              | null: false  unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |  
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association


* has_many :items
* has_many :orders


## items

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_name                           | string     | null: false                    |
| description                         | text       | null: false,                   |
| price                               | integer    | null: false                    |
| category_id                         | integer    | null: false                    |
| condition_id                        | integer    | null: false                    |
| shipping_id                         | integer    | null: false                    |
| shipping_from_id                    | integer    | null: false                    |
| shipping_date_id                    | integer    | null: false                    |
| user                                | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## addresses

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| order       | references | null: false, foreign_key: true |
| postal_code | string     | null: false                    |
| shipping_from_id   |  integer    | null: false             |
| city        | string     | null: false                    |
| address_line1 | string   | null: false                    |
| address_line2 | string   |                                |        
| phone_number  | string   | null: false                    |

### Association


* belongs_to :order

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
