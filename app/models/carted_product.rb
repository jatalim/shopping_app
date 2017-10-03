class CartedProduct < ApplicationRecord

  belongs_to :public_user
  belongs_to :product

  validates :product_quantity, presence: true

end
