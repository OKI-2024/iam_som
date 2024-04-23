FactoryBot.define do
  factory :review do
    content { 'This is a great wine!' }
    user
    wine
    wine_date { Faker::Date.backward(days: 30) }
    wine_bar { Faker::Restaurant.name }
    sweetness { Faker::Number.between(from: 1, to: 5) }
    bitterness { Faker::Number.between(from: 1, to: 5) }
    acidity { Faker::Number.between(from: 1, to: 5) }
    alcohol { Faker::Number.between(from: 1, to: 5) }

    after(:create) do |review|
      review.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.jpg')),
                          filename: 'test_image.jpg',
                          content_type: 'image/jpeg')
      review.fragrances = build_list(:fragrance, 3)
    end
  end
end
