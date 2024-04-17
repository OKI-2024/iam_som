class CreateWines < ActiveRecord::Migration[7.0]
  def change
    create_table :wines do |t|
      t.string :name, null: false
      t.string :producer
      t.integer  :type_id
      t.integer  :grape_variety_id
      t.integer  :region_id

      t.timestamps
    end
  end
end
