class Tag < ApplicationRecord

  belongs_to :post_taggings
  has_many :products, :through => :post_taggings

end
