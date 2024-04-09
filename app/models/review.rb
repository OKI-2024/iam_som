class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :wine

  validates_presence_of :sweetness, :bitterness, :acidity, :alcohol
  validates :fragrance_id, numericality: { other_than: 1 }


  def self.wine_attributes
    %i[sweetness bitterness acidity alcohol]
  end
  
end
