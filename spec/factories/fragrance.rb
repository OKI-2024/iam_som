FactoryBot.define do
  factory :fragrance do
    name { Faker::Food.fruits }
    category { ['フルーティー', 'スパイシー', '木香', '地元の特徴', 'フローラル', "その他の風味"].sample }
  end
end
