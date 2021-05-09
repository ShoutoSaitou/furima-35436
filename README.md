# DB 設計

## users table

| Column              | Type                | Options                  |
|---------------------|---------------------|--------------------------|
| nickname            | string              | null: false              |
| email               | string              | null: false unique: true |
| encrypted_password  | string              | null: false              |
| last_name           | string              | null: false              |
| first_name          | string              | null: false              |
| last_name_katakana  | string              | null: false              |
| first_name_katakana | string              | null: false              |
| birthday            | date                | null: false              |

### Association

* has_many :items
* has_many :purchase_records

## items table

| Column              | Type                | Options                 |
|---------------------|---------------------|-------------------------|
| name                | string              | null: false             |
| description         | text                | null: false             |
| category_id         | integer             | null: false             |
| condition_id        | integer             | null: false             |
| shipping_charges_id | integer             | null: false             |
| delivery_area_id    | integer             | null: false             |
| days_to_ship_id     | integer             | null: false             |
| price               | integer             | null: false             |
| user                | references          | foreign_key: true       |


### Association

* belongs_to :user
* has_one :purchase_record
* has_one :delivery

## deliveries table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| delivery_area_id   | integer             | null: false             |
| municipality       | string              | null: false             |
| address            | string              | null: false             |
| building           | string              |                         |
| phone_number       | string              | null: false             |
| item               | references          | foreign_key: true       |

### Association
* belongs_to :item

## purchase_records table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |

### Association

* belongs_to :user
* belongs_to :item
