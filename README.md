# テーブル設計

## Usersテーブル

| Column             | Type   | Options                           |
|--------------------|--------|-----------------------------------|
| id                 | bigint | null: false, primary key          |
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
- has_one :order

## Itemsテーブル

| Column              | Type       | Options                           |
|---------------------|------------|-----------------------------------|
| id                  | bigint     | null: false, primary key          |
| name                | string     | null: false                       |
| description         | text       | null: false                       |
| category_id         | bigint     |                                   |
| condition_id        | bigint     |                                   |
| shipping_fee_id     | bigint     |                                   |
| shipping_day_id     | bigint     |                                   |
| region_id           | bigint     |                                   |
| user_id             | bigint     | foreign key: true                 |
| price               | integer    | null: false                       |
| shipping_address_id | bigint     |                                   |
| shipping_phone      | bigint     |                                   |

### Association
- belongs_to :category
- belongs_to :user
- has_one :purchase
- has_one :order
- belongs_to :region
- belongs_to :condition
- belongs_to :shipping_fee
- belongs_to :shipping_day

## Categoriesテーブル

| Column          | Type    | Options                           |
|-----------------|---------|-----------------------------------|
| id              | bigint  | null: false, primary key          |
| name            | integer | null: false                       |

### Association
- has_many :items

## Regionsテーブル

| Column            | Type    | Options                           |
|-------------------|---------|-----------------------------------|
| id                | bigint  | null: false, primary key          |
| region            | integer | null: false                       |

### Association
- has_many :item
- has_many :order


## Conditionsテーブル

| Column          | Type    | Options                           |
|-----------------|---------|-----------------------------------|
| id              | bigint  | null: false, primary key          |
| condition       | integer | null: false                       |

### Association
- has_many :item


## Shipping_feesテーブル

| Column          | Type    | Options                           |
|-----------------|---------|-----------------------------------|
| id              | bigint  | null: false, primary key          |
| shipping_fee    | integer | null: false                       |

### Association
- has_many :item


## Shipping_daysテーブル

| Column          | Type    | Options                           |
|-----------------|---------|-----------------------------------|
| id              | bigint  | null: false, primary key          |
| shipping_day    | integer | null: false                       |

### Association
- has_many :item


## Purchasesテーブル

| Column          | Type   | Options                           |
|-----------------|--------|-----------------------------------|
| id              | bigint | null: false, primary key          |
| user            | bigint | null: false, foreign key: true    |
| item            | bigint | null: false, foreign key: true    |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order

## Ordersテーブル

| Column              | Type       | Options                           |
|---------------------|------------|-----------------------------------|
| id                  | bigint     | null: false, primary key          |
| user                | bigint     | null: false, foreign key: true    |
| item                | bigint     | null: false, foreign key: true    |
| post_code           | bigint     | null: false,                      |
| region_id           | bigint     | null: false,                      |
| city                | bigint     | null: false,                      |
| street_address      | string     | null: false,                      |
| building_name       | string     |                                   |
| phone_number        | string     | null: false,                      |

### Association
- belongs_to :item
- belongs_to :purchase
- belongs_to :region