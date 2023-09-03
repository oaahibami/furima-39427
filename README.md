# テーブル設計

## Usersテーブル

| Column             | Type   | Options                        |
|--------------------|--------|--------------------------------|
| id                 | bigint | not null, primary key          |
| nickname           | string | not null                       |
| email              | string | not null, unique: true         |
| encrypted_password | string | not null                       |
| full_name          | string | not null                       |
| kana_name          | string | not null                       |
| date_of_birth      | date   | not null                       |

### Association
- has_many :items
- has_many :purchases

## Itemsテーブル

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| id                  | bigint     | not null, primary key          |
| name                | string     | not null                       |
| description         | text       | not null                       |
| category_id         | integer    | not null, foreign key: true    |
| condition           | string     | not null                       |
| shipping_fee        | string     | not null                       |
| users_id            | bigint     | not null, foreign key: true    |
| price               | integer    | not null                       |
| shipping_address_id | bigint     | not null, foreign key: true    |
| shipping_phone_id   | bigint     | not null, foreign key: true    |

### Association
- belongs_to :category
- belongs_to :user
- has_one :purchase

## Categoriesテーブル

| Column          | Type   | Options                        |
|-----------------|--------|--------------------------------|
| id              | bigint | not null, primary key          |
| name            | string | not null                       |

### Association
- has_many :items

## Regionsテーブル

| Column          | Type   | Options                        |
|-----------------|--------|--------------------------------|
| id              | bigint | not null, primary key          |
| name            | string | not null                       |

### Association
- (このテーブルは現時点ではアソシエーションを持っていません)

## Purchasesテーブル

| Column          | Type   | Options                        |
|-----------------|--------|--------------------------------|
| id              | bigint | not null, primary key          |
| users_id        | bigint | not null, foreign key: true    |
| items_id        | bigint | not null, foreign key: true    |

### Association
- belongs_to :user
- belongs_to :item

## Ordersテーブル

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| id                  | bigint     | not null, primary key          |
| shipping_address_id | bigint     | not null, foreign key: true    |
| shipping_phone_id   | bigint     | not null, foreign key: true    |

### Association
- (このテーブルは現時点ではアソシエーションを持っていません)