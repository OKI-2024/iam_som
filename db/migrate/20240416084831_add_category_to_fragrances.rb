class AddCategoryToFragrances < ActiveRecord::Migration[7.0]
  def change
    add_column :fragrances, :category, :string
  end
end
