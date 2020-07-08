class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :postal_number, presence: true
  validates :address, presence: true
  validates :name, presence: true

 def address_detail
 	"#{self.postal_number}#{self.address}#{self.name}"
 end
end
