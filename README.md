# README

## Users table

| Column             | Type    | Options    | 
| ------------------ | ------- | ---------- | 
| nickname           | string  | null:false | 
| email              | string  | null:false | 
| encrypted_password | string  | null:false | 
| first_name         | string  | null:false | 
| last_name          | string  | null:false | 
| first_name_kana    | string  | null:false | 
| last_name_kana     | string  | null:false | 
| birthday           | date    | null:false | 

<!-- password → encrypted_password -->
<!-- deviseでのユーザー管理機能を実装するときは、passwordだとセキュリティの観点から好ましくないため、encrypted_passwordとすればデフォルトでカラムが作成され、暗号化したpasswordを保存することが必須となる。 -->
<!-- 誕生日にはdate型を使う -->

### Association

- has_many :items
- has_many :purchase_records

## Items table

| Column          | Type       | Options          | 
| --------------- | ---------- | ---------------- |  
| name            | string     | null:false       | 
| text            | text       | null:false       | 
| category_id     | integer    | null:false       | 
| condition_id    | integer    | null:false       | 
| postage_id      | integer    | null:false       | 
| region_id       | integer    | null:false       | 
| day_id          | integer    | null:false       | 
| price           | integer    | null:false       | 
| user            | references | foreign_key:true | 

<!-- item_nameというカラム名にすると、@item.item_nameとなってしまうため、名前カラムはnameのみが好ましい -->
<!-- imageカラムはactive_storage導入時に自動でテーブルなどが生成されるため、不要 -->
<!-- ActiveHashで実装予定のカラムはinteger型。理由として、ActiveHashは絶対に変わらない文字列のデータを数値として管理するときに使うため。_idをつけておくと実装に便利-->
<!-- reference型のときは_idは不要 -->

### Association

- belongs_to :user
- has_one :purchase_record

<!-- belongs_toのあとは単数形のテーブル名。 -->
<!-- has_oneのあとは単数形のテーブル名 -->

## Purchase_records table

| Column | Type       | Options          | 
| ------ | ---------- | ---------------- | 
| user   | references | foreign_key:true | 
| item   | references | foreign_key:true | 

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

### Addresses table

| Column          | Type       | Options          | 
| --------------- | ---------- | ---------------- | 
| postal_code     | string     | null:false       | 
| region_id       | integer    | null:false       | 
| city            | string     | null:false       | 
| house_name      | string     |                  |
| address_number  | string     | null:false       | 
| phone_number    | string     | null:false       | 
| purchase_record | references | foreign_key:true |

<!-- belongs_to :purchase_recordに合わせてカラム名もpurchase_recordにする -->

### Association

- belongs_to :purchase_record