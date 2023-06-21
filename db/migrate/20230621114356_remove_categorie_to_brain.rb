class RemoveCategorieToBrain < ActiveRecord::Migration[7.0]
  def change
    remove_column :brains, :categorie, :string
  end
end
