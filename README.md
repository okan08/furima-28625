# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| realname | string | null: false |
| furigana | string | null: false |
| birthday | date   | null: false |

### Association

- has_many :items
- has_many :buy_records

## items テーブル

| Column      | Type       | Options                        |
| ------      | ------     | ------------------------------ |
| image       | string     | null: false                    |
| cost        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| deliverypay | string     | null: false                    |
| place       | string     | null: false                    |
| day         | string     | null: false                    |


### Association

- belongs_to: user
- has_one : buy_record

## buy_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_many: addresses
- belongs_to: user
- belongs_to: item

## addresses テーブル

| Column     | Type       | Options     |
| ------     | ---------- | ------------|
| postnum    | integer    | null: false |
| prefecture | string     | null: false |
| city       | string     | null: false |
| housenum   | string     | null: false |
| building   | string     | null: true  |
| tel        | integer    | null: false |

### Association

- belongs_to: buy_record