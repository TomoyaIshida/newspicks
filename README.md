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

* has_many:articles

* has_many:comments

* has_many:pics


## articles table


|   Column   |       Type      |            Options              |
|:----------:|:---------------:|:-------------------------------:|
| sitename   | string          |null:false                       |
| url        | string          |null:false                       |
| titile     | string          |null:false                       |
| description| text            |null:false                       |
| image      | string          |null:false                       |

### Association

* belongs_to:user

* has_many:comments

* has_many:pics


## comments table


|   Column   |        Type       |              Options            |
|:----------:|:-----------------:|:-------------------------------:|
| user_id    | references:user   |foreign_key: true, index: true   |
| article_id | references:article|foreign_key: true, index: true   |
| body       | text              |null:false                       |

### Association

* belongs_to:user

* belongs_to:article


## pics table


|   Column   |         Type      |            Options              |
|:----------:|:-----------------:|:-------------------------------:|
| user_id    | references:user   |foreign_key: true, index: true   |
| article_id | references:article|foreign_key: true, index: true   |

### Association

* belongs_to:user

* belongs_to:article
