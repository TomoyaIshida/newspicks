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

* has_many :active_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy

* has_many :followings, through: :active_relationships, source: :following

* has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy

* has_many :followers, through: :passive_relationships, source: :follower


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


## relationships table


|    Column   |         Type      |            Options              |
|:-----------:|:-----------------:|:-------------------------------:|
| follower_id | integer           |unique: true                     |
| following_id| integer           |unique: true                     |

### Association

* belongs_to :follower, class_name: "User"

* belongs_to :following, class_name: "User"
