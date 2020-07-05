class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_fee
      t.integer :payment
      t.integer :payment_methods
      t.string :postal_number
      t.string :address
      t.string :name
      t.integer :order_status

      t.timestamps
    end
  end
end
