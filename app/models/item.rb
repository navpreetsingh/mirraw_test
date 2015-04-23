class Item < ActiveRecord::Base
	belongs_to :orders
  validates :product_name, :quantity, :rate , presence: true
end
