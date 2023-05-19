class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :sku, null: false  # cod unic 
      t.integer :stock, null: false
      t.float :price, null: false
      t.integer :quantity, null: false
      t.string :type, null: false # eau de parfum / eau de toilette
      t.string :notes, null: false  # olfactory notes
      t.timestamps
    end
  end
end
