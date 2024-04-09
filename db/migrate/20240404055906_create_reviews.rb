class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.bigint :user_id
      t.references :wine, null: false, foreign_key: true
      t.date :wine_date
      t.text :content
      t.string :wine_bar
      t.integer :sweetness
      t.integer :bitterness
      t.integer :acidity
      t.integer :alcohol
      t.json :fragrances
      
  
      t.timestamps
    end
  end
end
