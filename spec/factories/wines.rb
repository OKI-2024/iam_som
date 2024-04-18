# spec/factories/wines.rb
FactoryBot.define do
  factory :wine do
    name { "Chateau #{Faker::Name.last_name}" }
    region_id { Faker::Number.between(from: 2, to: 33) }
    grape_variety_id { Faker::Number.between(from: 2, to: 25) }
    type_id { Faker::Number.between(from: 2, to: 7) }

    after(:build) do |wine|
      wine.image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.jpg')),
        filename: 'test_image.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
