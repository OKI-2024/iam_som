class Review < ApplicationRecord
  belongs_to :grape_variety
  belongs_to :type

  validates :grape_variety_id, numericality: { other_than: 1 }
  validates :type_id, numericality: { other_than: 1 }

end
