class AddCategoryToBrain < ActiveRecord::Migration[7.0]
  def change
    add_column :brains, :category, :string
  end
end
