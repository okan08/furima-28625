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

| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| furigana_last      | string | null: false |
| furigana_first     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :buy_records


## items テーブル

| Column         | Type       | Options                        |
| ------         | ------     | ------------------------------ |
| item_name      | string     | null: false                    |
| introduction   | string     | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| category_id    | integer    | null: false                    |
| condition_id   | integer    | null: false                    |
| deliverypay_id | integer    | null: false                    |
| place_id       | integer    | null: false                    |
| day_id         | integer    | null: false                    |

### Association

- belongs_to: user
- has_one : buy_record
- belongs_to: category 
- belongs_to: condition 
- belongs_to: deliverypay
- belongs_to: place
- belongs_to: day

- has_many: items    # active hash (category, condition, deliverypay, place, day)に関して
 

## buy_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one: address
- belongs_to: user
- belongs_to: item


## addresses テーブル

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| postnum        | string     | null: false                    |
| city           | string     | null: false                    |
| housenum       | string     | null: false                    |
| building       | string     |                                |
| tel            | string     | null: false                    |
| buy_record     | references | null: false, foreign_key: true |
| prefecture_id  | integer    | null: false                    |

### Association

- belongs_to: buy_record
- belongs_to: prefecture  # (アクティブハッシュのため)

- has_many: addresses  # active hash (prefecture) に関して