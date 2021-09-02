# README

## アプリケーション名
『みんなのカレンダーアプリ』

##　概要
- コンセプト  
仲間とカレンダーを共有できるアプリ
あの予定表ってどこにあったっけをなくせるようにするアプリ

- ターゲット  
プライベートでカレンダーを使用するユーザーとその親しい関係のユーザー
チームで予定等を組んで動いているユーザー

- デザイン  
直感でとりあえずダウンロードしてみようかなと思うデザインを目指す

## URL
＊実装後に記載します。

## テスト用アカウント
＊実装後に記載します。

## 利用方法
＊実装後に記載します。

## 洗い出した要件
- ユーザー
 - ログイン
 - サインアップ
 - 編集
 - SNS認証（今後実装予定）
- グループ
 - メンバー 参加申請/承認・非承認
 - ルーム認証機能（今後実装予定）
 - 検索機能
 - スケジュール管理
  - 予定 登録/編集/削除
  - 予定 コメント作成
  - Googleカレンダーとの連動（今後実装予定）

## 実装スケジュール
1. ユーザー
1. ルーム
1. カレンダー
1. 予定登録
1. コメント
1. google calendarとの連動

## 実装した機能についての画像やGIFおよびその説明

## 実装予定の機能

## データベース設計

## ローカルでの動作方法

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
| name                 | string     | null: false, unique: true      |
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
| content              | text       | null: false                    |
| start_time           | datetime   | null: false                    |
| end_date             | datetime   | null: false                    |
| user                 | references | null: false, foreign_key: true |
| room                 | references | null: false, foreign_key: true |

###Asociation
- belongs_to :user
- belongs_to :room

## applyテーブル
| column               | type       | options                        |
|:--------------------:|:----------:|:------------------------------:|
| user                 | references | null: false, foreign_key: true |
| room                 | references | null: false, foreign_key: true |

###Asociation
- belongs_to :user
- belongs_to :room
