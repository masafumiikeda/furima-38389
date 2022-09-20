## usersテーブル

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|last_name         |string|null: false              |
|first_name        |string|null: false              |
|last_name_kana    |string|null: false              |
|first_name_kana   |string|null: false              |
|birthday          |string|null: false              |

### Association
- has_many :items
- has_many :buyers

## itemsテーブル

|Column            |Type   |Options                      |
|------------------|-------|-----------------------------|
|image             |json   |null: false                  |
|name              |string |null: false                  |
|description       |text   |null: false                  |
|category_id       |integer|null: false                  |
|status_id         |integer|null: false                  |
|delivery_id       |integer|null: false                  |
|sender_id         |integer|null: false                  |
|date_id           |integer|null: false                  |
|price             |string |null: false                  |
|user_id           |integer|null: false, foreign_key:true|
|buyer_id          |integer|null: false, foreign_key:true|

### Association
- belongs_to :user
- has_one :buyer
- belongs_to :category
- belongs_to :status
- belongs_to :delivery
- belongs_to :sender
- belongs_to :date

## buyerテーブル

|Column            |Type   |Options                      |
|------------------|-------|-----------------------------|
|user_id           |integer|null: false, foreign_key:true|
|item_id           |integer|null: false, foreign_key:true|
|address_id        |integer|null: false, foreign_key:true|

### Association
- belongs_to :user
- has_one :item
- has_one :address

## addressesテーブル

|Column            |Type   |Options                      |
|------------------|-------|-----------------------------|
|post_code         |string |null: false                  |
|prefecture_id     |integer|null: false                  |
|city              |string |null: false                  |
|address           |string |null: false                  |
|building          |string |null: false                  |
|phone_number      |string |null: false                  |
|buyer_id          |integer|null: false, foreign_key:true|

### Association
- has_one :buyer
- belongs_to :prefecture
