class CreateWines < ActiveRecord::Migration[7.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :region
      t.string :producer
      t.string :grape_variety

      

      t.timestamps
    end
  end
end
