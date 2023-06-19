class CreateBrains < ActiveRecord::Migration[7.0]
  def change
    create_table :brains do |t|

      t.timestamps
    end
  end
end
