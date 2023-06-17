class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.bigint :user_id, null: false
      t.string :tracking_number
      t.string :status, default: "not shipped"
      t.timestamps
    end
  end
end
