class CreateItemGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :item_genres do |t|
      t.string :name, null: false
      t.boolean :is_delete, null: false, default: false

      t.timestamps
    end
  end
end
