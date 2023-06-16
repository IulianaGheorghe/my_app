class CreateOrderedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :ordered_products do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :order, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
