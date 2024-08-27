# README

# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| id                 | string              | null: false, unique: true |
| name               | text                | null: false               |
| email              | string              | null: false  unique: true |
| password           | string              | null: false  unique: true |
| created_at         | string              | null: false               |
| update_at          | string              | null: false               |

### Association

* has_many :user
* has_many :items

## items

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_id                             | string     | null: false                    |
| user_id                             | string     | null: false                    |
| item_name                           | text       | null: false                    |
| description                         | references | null: false, foreign_key: true |

### Association

- has_many :user
- has_many :oreders

## oreders

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| oreder_id   | string     | null: false                    |
| user_id     | string     | null: false, foreign_key: true |
| total_price | string     | null: false,                   |

### Association

- has_many :items
- has_many :user

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
