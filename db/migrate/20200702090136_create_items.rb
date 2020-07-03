class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :image_id
      t.boolean :is_active, null: false, default: true
      t.integer :item_genre_id, null: false

      t.timestamps
    end
  end
end
