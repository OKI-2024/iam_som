class CreateFragranceReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :fragrance_reviews do |t|
      t.references :fragrance, foreign_key: true
      t.references :review, foreign_key: true
      t.timestamps
    end
  end
end
