class Item < ApplicationRecord
	# デモデータを作成したいときは:itemgenreの後ろに　optinal: true　を記述
	# ただしvalidationを受けていないデータなので実際のデータとしては使用せずあくまでデモデータとして使用
  belongs_to :item_genre, optional: true
  has_many :cart_items
  attachment :image

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :item_genre_id, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end
