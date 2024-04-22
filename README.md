# アプリケーション名
ワインノミタイ

## アプリケーション概要
- ワイン検索（ワイン名・産地・ブドウ品種・生産者・キーワード）
- レビュー投稿（感想や写真の他、酸味や渋みなどの5段階で評価、約70種類の香りから複数チェック）

## アプリケーションを作成した背景
要整理
- ワインを身近なものに
- 客と店で情報の非対称性あり
- 敷居の高さやあまたある独特な表現方法
- 歴史があるから会話が生まれる
- 五感で味わう
- 感性を磨きを自分の好みをみつける
- めちゃくちゃ美味しいし、食事の場を～～～

## URL
[アプリケーションURL](http://54.250.155.78/)

## BASIC認証
- Basic認証ID　　　:　enter
- Basic認証PW　　　:　5757

## テスト用アカウント
- メールアドレス　　:　test@com
- パスワード　　　　:　password123


## 利用方法
1. テスト用アカウントでログインする。または、アカウント作成から新規登録。
2. 画面中央の「条件を絞って検索する」ボタンをクリックし、種類・生産地を選択し、検索。または、検索窓にキーワードを入力し、検索。
※ブドウ品種による検索は未実装
3. 検索結果一覧から任意のワイン詳細ページに遷移。
4. 詳細ページからそのワインのレビュー投稿画面へ遷移し、レビュー投稿。


## メイン機能についての画像やGIF
- トップページ
[![Image from Gyazo](https://i.gyazo.com/27cb72f86042a4b9693c95fc99c6fa1b.png)](https://gyazo.com/27cb72f86042a4b9693c95fc99c6fa1b)

- 検索フォーム　→　検索一覧
[![Image from Gyazo](https://i.gyazo.com/5b39e8d710fe54b9470d98cec8c15b91.gif)](https://gyazo.com/5b39e8d710fe54b9470d98cec8c15b91)
- 投稿フォーム　→　ワイン詳細
[![Image from Gyazo](https://i.gyazo.com/5fdb4fca786be4abd787b740b3072c41.gif)](https://gyazo.com/5fdb4fca786be4abd787b740b3072c41)


## 実装予定の機能
- ワイン登録機能 : 現在はサーバー側が用意したワインのみしかレビューができない仕様だが、ユーザーが自由にワインの情報を登録できるようにする
- 検索機能のアップデート : より詳細な地域（ブルゴーニュ、アルザス等）やブドウ品種での検索絞り込みができるようにする
- お気に入り機能 : 好みのワインを登録し、一覧管理
- サジェスト機能 : お気に入りのワインに紐づいている香りや味の評価からユーザーの好みを分析し、適したワインを提案
- 購入機能 : アプリケーション上で気になったワインを購入することができる
- その他 : googleのAPIを活用して購入店や飲食店の情報も掲載、レシピサイトのAPIを活用してワインに合うレシピを提供 

## データベース設計

### ER図
[![Image from Gyazo](https://i.gyazo.com/82698119d4b6aaa39e8ca87f9432156b.png)](https://gyazo.com/82698119d4b6aaa39e8ca87f9432156b)

### Users Table
| Column Name          | Data Type | Additional Info        |
|----------------------|-----------|------------------------|
| email                | string    | Required, Unique      |
| encrypted_password   | string    | Required              |
| nickname             | string    | Required, Unique      |

#### Associations:
- User has many Reviews

### Wines Table
| Column Name        | Data Type | Additional Info          |
|--------------------|-----------|--------------------------|
| name               | string    | Required                 |
| producer           | string    |                          |
| type_id            | integer   |                          |
| grape_variety_id   | integer   |                          |
| region_id          | integer   |                          

#### Associations:
- Wine has many Reviews

### Reviews Table
| Column Name         | Data Type | Additional Info          |
|---------------------|-----------|--------------------------|
| user_id             | bigint    | Foreign Key (references users) |
| wine             | references    | Foreign Key (references wines) |
| wine_date           | date      |                          |
| content             | text      | Max length: 240 characters |
| wine_bar            | string    |                          |
| sweetness           | integer   |                          |
| bitterness          | integer   |                          |
| acidity             | integer   |                          |
| alcohol             | integer   |                          |

#### Associations:
- Review belongs to User and Wine
- Review has many FragranceReviews
- Review has many Fragrances through FragranceReviews

### Fragrances Table
| Column Name | Data Type | Additional Info |
|-------------|-----------|-----------------|
| name        | string    |                 |
| category    | string    |                 |

#### Associations:
- Fragrance has many FragranceReviews
- Fragrance has many Reviews through FragranceReviews

### FragranceReviews Table
| Column Name | Data Type | Additional Info                           |
|-------------|-----------|-------------------------------------------|
| fragrance   | references| Foreign Key (references fragrances)       |
| review      | references| Foreign Key (references reviews)          |

#### Associations:
- FragranceReview belongs to Fragrance and Review


## 画面遷移図
[画面遷移図URL]([![Image from Gyazo](https://i.gyazo.com/0865acb7d0d36d6b878e2bab995b022c.png)](https://gyazo.com/0865acb7d0d36d6b878e2bab995b022c))

## アーキテクチャ図

## 開発環境

#### フロントエンド
- HTML, CSS, bootstrap, JavaScript

#### バックエンド
- Ruby 3.2.0, Ruby on Rails 7.0.8.1

#### データベース
- MySQL 5.7.44（開発環境）
- MariaDB 5.5.68（本番環境）

#### ソース管理
- GitHub, GitHub Desktop

#### デプロイ/運用
- AWS
  - Amazon S3
  - Amazon EC2
- Nginx
- Unicorn


## 工夫したポイント
- 工夫したポイントをここに記述します。

## 改善点
- 改善点をここに記述します。
