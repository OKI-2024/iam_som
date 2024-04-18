FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name[0...10] } # 最大10文字
    email { Faker::Internet.email }
    password { 'password' } # 十分な長さと複雑さを持つパスワード
    introduction { Faker::Lorem.characters(number: 240) } # 最大240文字
  end
end