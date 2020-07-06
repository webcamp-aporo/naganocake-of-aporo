class ChangeColumnToOrderItem < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_items, :make_status, :integer, default: 0

  	change_column :order_items, :item_id, :integer, null: false
  	change_column :order_items, :order_id, :integer, null: false
  	change_column :order_items, :count, :integer, null: false
  	change_column :order_items, :make_status, :integer, null: false
  	change_column :order_items, :price, :integer, null: false

  	change_column :order_items, :item_id, :integer, index: true
  	change_column :order_items, :order_id, :integer, index: true
  end
end
