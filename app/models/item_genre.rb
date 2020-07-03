class ItemGenre < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  #真偽値の存在をチェックしたい場合には以下を記述
  validates :is_delete, inclusion: { in: [true, false] }

  has_many :items
end
