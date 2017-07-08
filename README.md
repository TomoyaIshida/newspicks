# DB設計

## users table


|   Column   |     Type    |              Options                |
|:----------:|:-----------:|:-----------------------------------:|
| name       | string      |index: true, null: false, unique:true|
| email      | string      |null:false                           |
| company    | string      |                                     |
| position   | string      |                                     |
| profile    | string      |                                     |
| image      | string      |                                     |

### Association

* has_many:articles, through: :picks

* has_many:picks

* has_many:reads


## articles table


|   Column   |       Type      |               Options               |
|:----------:|:---------------:|:-----------------------------------:|
| sitename   | string          |null:false                           |
| url        | string          |index: true, null: false, unique:true|
| titile     | string          |null:false                           |
| description| text            |null:false                           |
| image      | string          |null:false                           |

### Association

* has_many:users, through: :picks

* has_many:picks

* has_manuy:reads

## picks table


|   Column   |         Type      |            Options              |
|:----------:|:-----------------:|:-------------------------------:|
| user_id    | references:user   |foreign_key: true, index: true   |
| article_id | references:article|foreign_key: true, index: true   |
| text       | string            |null:false                       |

### Association

* belongs_to:user

* belongs_to:article


## reads table


|   Column   |         Type      |            Options              |
|:----------:|:-----------------:|:-------------------------------:|
| user_id    | references:user   |foreign_key: true, index: true   |
| article_id | references:article|foreign_key: true, index: true   |

### Association

* belongs_to:user

* belongs_to:article
