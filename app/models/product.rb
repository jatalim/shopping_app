class Product < ApplicationRecord

  mount_uploader :image, AvatarUploader

  has_many :carted_products
  has_many :ordered_products

  has_many :product_taggings, dependent: :destroy

  has_many :tags, :through => :product_taggings

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

end
