class CreateOptionsOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :options_orders, :id => false do |t|
        t.references :option
        t.references :order
    end
    # add_index :options_orders, :option_id
    # add_index :options_orders, :order_id
    
  end
end
