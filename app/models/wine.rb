class Wine < ApplicationRecord
  belongs_to :grape_variety
  belongs_to :type
  belongs_to :region

  validates :grape_variety_id, numericality: { other_than: 1 }
  validates :type_id, numericality: { other_than: 1 }

end
