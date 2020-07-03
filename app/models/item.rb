class Item < ApplicationRecord
  belongs_to :item_genre
  attachment :image

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :item_genre_id, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end
