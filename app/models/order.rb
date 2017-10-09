class Order < ApplicationRecord
	belongs_to :order_status
	has_many :ordered_products
	belongs_to :public_user
	has_many :carted_products

	before_validation :set_order_status, on: :create

	private 
	def set_order_status
		if order_status_id == nil 
			self.order_status_id = 1
		else
			self[:order_status_id] 
		end 
	end 



end
