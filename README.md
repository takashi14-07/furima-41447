# README

# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nick_name          | string              | null: false               |
| email              | string              | null: false  unique: true |
| password_digest    | string              | null: false  unique: true |
| password_confirmation |                  | null: false               |
|last_name           | string              | null: false               |
| first_name         | string              | null:false                |
| last_name_kana     | string              | null: false               |  
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_one :user
* has_many :items
* has_many :address


## items

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_name                           | text       | null: false                    |
| description                         | references | null: false,                   |

### Association

- has_one :user
- has_many :oreders

## oreders

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| total_price | string     | null: false,                   |
| status      | string     | null: false                    |

### Association

- belongs_to
- has_many :user

## Categories

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| Categories_name | string     | null: false,               |

### Association

* belongs_to :users


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
