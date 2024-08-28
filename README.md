# README

# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nick_name          | string              | null: false               |
| email              | string              | null: false  unique: true |
| encrypted_password | string              | null: false  unique: true |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |  
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association


* has_many :items
* has_many :address


## items

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_name                           | string     | null: false                    |
| description                         | text       | null: false,                   |
| price                               | ecimal     | null: false                    |
| stock_quantity                       |integer    | null: false                    |

### Association

- has_one :user
- has_many :oreders

## oreders

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| total_price | string     | null: false,                   |
| status      | string     | null: false                    |
| users       | references | null: false, foreign_key: true |
| items       | references | null: false, foreign_key: true |

### Association

- belongs_to
- has_many :user

## address

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | integer    | null: false, foreign_key: true |
| postal_code | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| address_line1 | string   | null: false                    |
| address_line2 | string   | null: false                    |        
| phone_number  | string   | null: false                    |

### Association

* has_many :user


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
