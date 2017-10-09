class Tag < ApplicationRecord

  has_many :product_taggings
  has_many :products, :through => :product_taggings

  validates :name, presence: true

end
