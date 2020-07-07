class ChangeColumnToOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :order_status, :integer, default: 0

  	change_column :orders, :customer_id, :integer, index: true

  	change_column :orders, :customer_id, :integer, null: false
  	change_column :orders, :shipping_fee, :integer,null: false
  	change_column :orders, :payment, :integer, null: false
  	change_column :orders, :payment_methods, :integer, null: false
  	change_column :orders, :postal_number, :string, null: false
  	change_column :orders, :address, :string, null: false
  	change_column :orders, :name, :string, null: false
  	change_column :orders, :order_status, :integer, null: false
  end
end
