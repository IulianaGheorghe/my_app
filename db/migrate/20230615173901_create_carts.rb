class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
