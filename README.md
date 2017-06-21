# DB設計

## users table

| column     | Type        | Option                   |
|:-----------|------------:|:------------------------:|
|  name      | string      | null: false,unique: true |
|  email     | varchar     | null: false,unique: true |
|  password  | varchar     | null: false,unique: false|

### Association

* has_many : groups,through: group_users
* has_many : messages
* has_many : group_users

## group tables

| column     | Type        | Option                   |
|:-----------|------------:|:------------------------:|
|  name      | string      | null: false,unique: true |

### Association

* has_many : users,through: group_users
* has_many : messages
* has_many : group_users

## group_users table

| column     | Type        | Option                        |
|:-----------|------------:|:-----------------------------:|
|  group_id  | integer     | null: false,foreign_key: true |
|  user_id   | integer     | null: false,foreign_key: true |

### Association

* belongs_to : user
* belongs_to : group

## message table

| column     | Type        | Option                        |
|:-----------|------------:|:-----------------------------:|
|  body      | text        |                               |
|  image     | string      |                               |
|  group_id  | integer     | null: false,foreign_key: true |
|  user_id   | integer     | null: false,foreign_key: true |

### Association
* belongs_to : user
* belongs_to : group
