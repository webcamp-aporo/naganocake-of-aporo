class ItemGenre < ApplicationRecord
  validates :name, presence: true
  #真偽値の存在をチェックしたい場合には以下を記述
  validates :is_delete, inclusion: { in: [true, false] }
end
