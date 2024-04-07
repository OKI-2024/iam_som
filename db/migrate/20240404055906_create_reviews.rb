class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer    :grape_variety_id
      t.integer    :type_id
      t.integer    :region_id
      t.text       :content
      t.integer    :sweetness
      t.integer    :bitterness
      t.integer    :acidity
      t.integer    :alcohol

      t.timestamps
    end
  end
end
