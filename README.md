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

### Association

- has_many :items
- has_many :purchase_records

## Items table

| Column          | Type      | Options          | 
| --------------- | --------- | ---------------- |  
| name            | string     | null:false       | 
| text            | text       | null:false       | 
| category_id     | integer    | null:false       | 
| condition_id    | integer    | null:false       | 
| postage_id      | integer    | null:false       | 
| region_id       | integer    | null:false       | 
| days_id         | integer    | null:false       | 
| price           | integer    | null:false       | 
| user            | references | foreign_key:true | 

### Association

- belongs_to :user
- has_one :purchase_records

## Purchase_records table

| Column | Type       | Options          | 
| ------ | ---------- | ---------------- | 
| user   | references | foreign_key:true | 
| item   | references | foreign_key:true | 

### Association

- belongs_to :items
- belongs_to :users
- has_one :addresses

### Addresses table

| Column          | Type       | Options          | 
| --------------- | ---------- | ---------------- | 
| postal_code     | string     | null:false       | 
| prefecture_id   | integer    | null:false       | 
| city            | string     | null:false       | 
| house_name      | string     |                  |
| address_number  | string     | null:false       | 
| phone_number    | string     | null:false       | 
| purchase_record | references | foregin_key:true |

### Association

- belongs_to :purchase_record