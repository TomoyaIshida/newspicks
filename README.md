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

* has_many:article, through: user_articles

* has_many:comments

* has_many:pics

* has_many:articles


## articles table


|   Column   |       Type      |            Options              |
|:----------:|:---------------:|:-------------------------------:|
| sitename   | string          |                                 |
| url        | string          |                                 |
| titile     | string          |                                 |
| description| string          |                                 |
| image      | string          |                                 |

### Association

* has_many:user, through: user_articles

* has_many:comments

* has_many:pics

* has_many:users


## comments table


|   Column   |      Type       |              Options            |
|:----------:|:---------------:|:-------------------------------:|
| user_id    | references:user |foreign_key: true, index: true   |
| article_id | references:group|foreign_key: true, index: true   |
| body       | text            |null:false                       |

### Association

* belongs_to:user

* belongs_to:group


## pics table


|   Column   |       Type      |            Options              |
|:----------:|:---------------:|:-------------------------------:|
| user_id    | references:user |foreign_key: true, index: true   |
| article_id | references:group|foreign_key: true, index: true   |

### Association

* belongs_to:user

* belongs_to:article


## user_articles table


|   Column   |       Type      |            Options              |
|:----------:|:---------------:|:-------------------------------:|
| user_id    | references:user |foreign_key: true, index: true   |
| article_id | references:group|foreign_key: true, index: true   |

### Association

* belongs_to:user

* belongs_to:article

