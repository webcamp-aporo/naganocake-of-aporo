class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_number, null: false
      t.string :address, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
