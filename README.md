# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | unique: true            |
| password           | string              | null: false             |
| name               | string              | null: false             |
| name_katakana      | string              | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many :items
* has_many :purchases

## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| item_name          | string              | null: false             |
| description        | text                | null: false             |
| category           | string              | null: false             |
| condition          | string              | null: false             |
| shipping_charges   | string              | null: false             |
| delivery_area      | string              | null: false             |
| days_to_ship       | string              | null: false             |
| price              | integer             | null: false             |
| seller_user        | references          | foreign_key: true       |

### Association

* belongs_to :user
* has_one :delivery

## deliveries table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefectures        | string              | null: false             |
| municipality       | string              | null: false             |
| address            | string              | null: false             |
| building           | string              | null: false             |
| phone_number       | integer             | null: false             |
| item               | references          | foreign_key: true       |

### Association

* belongs_to :item
* has_one :purchase_records

## purchase_records table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| item               | references          | foreign_key: true       |
| buyer_user         | references          | foreign_key: true       |

### Association

* belongs_to :item
* belongs_to :user