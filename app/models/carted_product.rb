class CartedProduct < ApplicationRecord
  belongs_to :public_user
  belongs_to :product
  belongs_to :order, optional: true 
  validates :product_quantity, presence: true


end
