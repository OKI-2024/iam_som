FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name[0...10] }
    email { Faker::Internet.email }
    password { 'password' }
    introduction { Faker::Lorem.characters(number: 240) }
  end
end
