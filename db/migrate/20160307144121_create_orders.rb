class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :from_location
      t.references :to_location
      t.references :order_state, foreign_key: true
      t.decimal :cost
      t.string :comment
      t.string :author
      t.integer :score

      t.timestamps
    end
    # add_index "orders", ["from_location_id"], name: "index_orders_on_from_location_id", using: :btree
    # add_index "orders", ["to_location_id"], name: "index_orders_on_to_location_id", using: :btree
  end
end
