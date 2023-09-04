# テーブル設計

## Usersテーブル

| Column             | Type   | Options                           |
|--------------------|--------|-----------------------------------|
| nickname           | string | null: false                       |
| email              | string | null: false, unique: true         |
| encrypted_password | string | null: false                       |
| last_name          | string | null: false                       |
| first_name         | string | null: false                       |
| last_name_kana     | string | null: false                       |
| first_name_kana    | string | null: false                       |
| date_of_birth      | date   | null: false                       |

### Association
- has_many :items
- has_many :purchases

## Itemsテーブル

| Column              | Type       | Options                           |
|---------------------|------------|-----------------------------------|
| name                | string     | null: false                       |
| description         | text       | null: false                       |
| category_id         | integer    | null: false                       |
| condition_id        | integer    | null: false                       |
| shipping_fee_id     | integer    | null: false                       |
| shipping_day_id     | integer    | null: false                       |
| region_id           | integer    | null: false                       |
| user                | references | null: false, foreign key: true    |
| price               | integer    | null: false                       |


### Association
- belongs_to :user
- has_one :purchase

## Purchasesテーブル

| Column          | Type       | Options                           |
|-----------------|------------|-----------------------------------|
| user            | references | null: false, foreign key: true    |
| item            | references | null: false, foreign key: true    |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order

## Ordersテーブル

| Column              | Type       | Options                           |
|---------------------|------------|-----------------------------------|
| purchase            | references | null: false, foreign key: true    |
| post_code           | string     | null: false                       |
| region_id           | integer    | null: false                       |
| city                | string     | null: false                       |
| street_address      | string     | null: false                       |
| building_name       | string     |                                   |
| phone_number        | string     | null: false                       |

### Association
- belongs_to :purchase