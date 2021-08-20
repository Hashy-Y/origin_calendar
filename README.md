# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## userテーブル
| column               | type   | options                   |
|:--------------------:|:------:|:-------------------------:|
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |

###Asociation
- has_many :rooms
- has_many :events

## roomテーブル
| column               | type       | options                        |
|:--------------------:|:----------:|:------------------------------:|
| name                 | string     | null: false                    |
| password_digest      | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

###Asociation
- has_many :user
- has_many :events


## room_userテーブル
| column               | type       | options                        |
|:--------------------:|:----------:|:------------------------------:|
| user                 | references | null: false, foreign_key: true |
| room                 | references | null: false, foreign_key: true |

###Asociation
- belongs_to :user
- belongs_to :room


## eventテーブル
| column               | type       | options                        |
|:--------------------:|:----------:|:------------------------------:|
| title                | string     | null: false                    |
| description          | text       | null: false                    |
| start_date           | datetime   | null: false                    |
| end_date             | datetime   | null: false                    |
| user                 | references | null: false, foreign_key: true |
| room                 | references | null: false, foreign_key: true |

###Asociation
- belongs_to :user
- belongs_to :room
