class Item < ActiveRecord::Base
	has_and_belongs_to_many :orders, :join_table => "orders_items"
end
