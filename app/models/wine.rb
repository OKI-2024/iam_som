class Wine < ApplicationRecord
  has_many :reviews

  validates :grape_variety_id, numericality: { other_than: 1 }
  validates :type_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }

end
