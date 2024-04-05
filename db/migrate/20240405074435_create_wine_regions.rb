class CreateWineRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :wine_regions do |t|
      t.string :name
      t.string :ancestry
      t.timestamps
    end
  end
end
