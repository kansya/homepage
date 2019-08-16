# README

# ruby version
## ruby 2.3.1p112

# DB設計

## articlesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|article|text|null: false|
|category|string|null: false|
|state|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|

### Association
- has_many :articles

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|nickname|string|null: false|
|article_id|references|null: false, foreign_key: true|

### Association
- belongs_to :article
