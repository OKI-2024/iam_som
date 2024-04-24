# アプリケーション名
ワインノミタイ

## アプリケーション概要
- ワイン検索（ワイン名・産地・ブドウ品種・生産者・キーワード）
- レビュー投稿（感想や写真投稿の他、酸味や渋みなどの5段階で評価、約70種類の香りから複数チェック）

## アプリケーションを作成した背景

ワイン初心者向けのアプリとして、個々人の感性を尊重し、自分自身の好みや感性を磨く手助けをすることを目指しています。ワインの世界は多様であり、個々人が異なる味わいや香りを感じる魅力がありますが、初心者にとってはワインの選択や評価が難しい場合があります。

専門用語や複雑な表現が多く、多くの人が自分の感性よりも専門家や販売者の意見に頼ってしまう傾向があります。しかし、ワインの味というものは本来は他人の評価よりも、自分がどう感じたかが大事であり、その感性を磨くことで好みのワインを選べるようになると思います。

とはいえ、私を含めた初心者にとってその味わいや香りを自分の言葉で表現することは難しい為、あらかじめ用意された約70種類の香りから近しいものを選択し、記録することで好みの傾向や味の違いが分かるようになり、自分に合ったワインが選べるようになります。また、好みを分析し、ユーザーに合ったワインをサジェストできるようにしたいと思っています。

## URL
[アプリケーションURL](http://54.250.155.78/)

## BASIC認証
- Basic認証ID　:　enter
- Basic認証PW　:　5757

## テスト用アカウント
- メールアドレス　　:　test@com
- パスワード　　　　:　password123


## 利用方法
1. テスト用アカウントでログイン。または、アカウント作成から新規登録。
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
- ワイン登録機能 : 現在はアプリ側が用意したワインのみしかレビューができない仕様だが、ユーザーがワインボトルを撮影することによって自由に登録できる仕様にしたい。
- 検索機能のアップデート : より詳細な地域（ブルゴーニュ、アルザス等）やブドウ品種での検索絞り込みをできるようにしたい。
- お気に入り機能 : 好みのワインを登録し、一覧管理できるようにしたい。
- サジェスト機能 : お気に入りのワインに紐づいている香りや味の評価からユーザーの好みを分析し、適したワインを提案できるようにしたい。
- 購入機能 : アプリケーション上で気になったワインを購入することができるようにしたい。
- その他 : googleのAPIを活用して購入店や飲食店の情報も掲載。気になったワインを飲むことができる飲食店を検索できる機能も実装したい。 

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

#### 開発ツール
- Visual Studio Code
#### フロントエンド
- HTML, CSS, bootstrap, JavaScript

#### バックエンド
- Ruby 3.2.0, Ruby on Rails 7.0.8.1

#### データベース
- MySQL 5.7.44（開発環境）
- MariaDB 5.5.68（本番環境）

#### ソース・バージョン管理
- GitHub, GitHub Desktop

#### デプロイ/運用
- AWS
  - Amazon S3
  - Amazon EC2
- Nginx
- Unicorn

#### テストフレームワーク
- RSpec


## 工夫したポイント
### 検索ロジックの最適化
ユーザーがスムーズに目的のワインを見つけるために、検索ロジックに特に注力しました。複数の検索条件を組み合わせてワインを絞り込むことができ、ワイン名や産地、生産者、さらにはキーワードによる検索が可能です。柔軟性と効率性を兼ね備えた検索機能を実装することで、ユーザーが求める情報に迅速かつ正確にアクセスできる環境を提供しています。

### 香りや風味の詳細な表示
ワインの豊かな香りや風味はその魅力の一つですが、これらを言葉で表現することは容易ではありません。このアプリでは、約70種類の香りや風味を詳細に表示し、ユーザーがワインの特性をより深く理解するのに役立つようにしました。5段階での評価と合わせて、ユーザーが自分の好みや感性に合ったワインを見つける手助けとなる情報を提供しています。

