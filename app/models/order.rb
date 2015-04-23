class Order < ActiveRecord::Base
	has_many :items
  validates :number, :date, :customer_name, presence: true
  validates :number, uniqueness: true
end
