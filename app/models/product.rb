class Product < ApplicationRecord

  has_many :carted_products
  has_many :product_taggings
  has_many :tags, :through => :product_taggings

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

end
