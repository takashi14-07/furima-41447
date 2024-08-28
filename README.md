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
* 


## items

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_name                           | string     | null: false                    |
| description                         | text       | null: false,                   |
| price                               | string     | null: false                    |
| category_id                         | integer    | null: false                    |
| condition_id                        | integer    | null: false                    |
| shippng_id                          | integer    | null: false                    |
| shippng_from_id                     | integer    | null: false                    |
| shippng_date_id                     | integer    | null: false                    |

### Association

- has_many :user
- has_one :orders


## orders

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :users
- has_many :items

## address

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| order       | references | null: false, foreign_key: true |
| postal_code | string     | null: false                    |
| shippng_from_id   |  integer    | null: false             |
| city        | string     | null: false                    |
| address_line1 | string   | null: false                    |
| address_line2 | string   |                                |        
| phone_number  | string   | null: false                    |

### Association

* has_many :users
* has_one :orders

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
