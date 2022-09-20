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
|birthday          |date  |null: false              |

### Association
- has_many :items
- has_many :buyers

## itemsテーブル

|Column            |Type      |Options                      |
|------------------|----------|-----------------------------|
|name              |string    |null: false                  |
|description       |text      |null: false                  |
|category_id       |integer   |null: false                  |
|status_id         |integer   |null: false                  |
|delivery_id       |integer   |null: false                  |
|prefecture_id     |integer   |null: false                  |
|days_id           |integer   |null: false                  |
|price             |integer   |null: false                  |
|user              |references|null: false, foreign_key:true|

### Association
- belongs_to :user
- has_one :buyer
- belongs_to :category
- belongs_to :status
- belongs_to :delivery
- belongs_to :prefecture
- belongs_to :date

## buyersテーブル

|Column            |Type      |Options                      |
|------------------|----------|-----------------------------|
|user              |references|null: false, foreign_key:true|
|item              |references|null: false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

|Column            |Type      |Options                      |
|------------------|----------|-----------------------------|
|post_code         |string    |null: false                  |
|prefecture_id     |integer   |null: false                  |
|city              |string    |null: false                  |
|address           |string    |null: false                  |
|building          |string    |                             |
|phone_number      |string    |null: false                  |
|buyer             |references|null: false, foreign_key:true|

### Association
- belongs_to :buyer
- belongs_to :prefecture
