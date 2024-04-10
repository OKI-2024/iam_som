class Fragrance < ApplicationRecord
  has_many :fragrance_reviews
  has_many :reviews, through: :fragrance_reviews
end
