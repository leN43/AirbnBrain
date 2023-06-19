class AddNameDescriptionPriceUserToBrain < ActiveRecord::Migration[7.0]
  def change
    add_column :brains, :name, :string
    add_column :brains, :description, :text
    add_column :brains, :price, :float
    add_reference :brains, :user, null: false, foreign_key: true
  end
end
