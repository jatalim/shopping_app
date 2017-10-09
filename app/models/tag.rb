class Tag < ApplicationRecord

  has_many :product_taggings, dependent: :destroy
  has_many :products, :through => :product_taggings

  validates :name, presence: true, uniqueness: true

end
