class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :wine

  attribute :fragrance_id, :integer  # ActiveHash を整数として扱う

  validates_presence_of :sweetness, :bitterness, :acidity, :alcohol
  serialize :fragrances, Array


  def self.wine_attributes
    %i[sweetness bitterness acidity alcohol]
  end
  
end
