class Wine < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :reviews
  belongs_to :region
  belongs_to :grape_variety, optional: true
  belongs_to :type
  has_one_attached :image


  validates :grape_variety_id, numericality: { other_than: 1, allow_nil: true }
  validates :type_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }

end
