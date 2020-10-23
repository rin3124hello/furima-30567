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
| birthday           | integer | null:false | 

### Association

- has_many :items
- has_many :purchase_records

## Items table

| Column    | Type      | Options          | 
| --------- | --------- | ---------------- |  
| item_name | string    | null:false       | 
| text      | text      | null:false       | 
| category  | string    | null:false       | 
| price     | integer   | null:false       | 
| user_id   | reference | foreign_key:true | 
| record_id | reference | foreign_key:true | 

### Association

- belongs_to :users
- has_one :purchase_records

## Purchase_records table

| Column  | Type      | Options          | 
| ------- | --------- | ---------------- | 
| who     | integer   | null:false       | 
| when    | integer   | null:false       | 
| what    | integer   | null:false       | 
| item_id | reference | foreign_key:true | 

### Association

- belongs_to :items
- belongs_to :users
- has_one :addresses

### Addresses table

| Column         | Type    | Options    | 
| -------------- | ------- | ---------- | 
| postal_code    | integer | null:false | 
| prefecture     | integer | null:false | 
| city           | integer | null:false | 
| address_number | string  | null:false | 
| phone_number   | string  | null:false | 

### Association

- belongs_to :purchase_records