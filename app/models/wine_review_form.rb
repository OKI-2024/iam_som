# app/forms/wine_review_form.rb
class WineReviewForm
  include ActiveModel::Model

  attr_accessor :name, :producer, :type_id, :grape_variety_id, :region_id,
                :wine_date, :content, :wine_bar, :sweetness, :bitterness,
                :acidity, :alcohol, :fragrances, :image, :user_id

  validates :name, presence: true
  validates :wine_date, presence: true
  validates :grape_variety_id, numericality: { other_than: 1 }
  validates :type_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }


  def save
    return false unless valid?

    wine = Wine.create!(
      name: name,
      producer: producer,
      type_id: type_id,
      grape_variety_id: grape_variety_id,
      region_id: region_id
    )

    Review.create!(
      wine: wine,
      wine_date: wine_date,
      content: content,
      wine_bar: wine_bar,
      sweetness: sweetness,
      bitterness: bitterness,
      acidity: acidity,
      alcohol: alcohol,
      fragrances: fragrances,
      image: image,
      user_id: user_id
    )
  end
end
