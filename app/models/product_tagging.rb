class ProductTagging < ApplicationRecord

  belongs_to :product
  belongs_to :tag

  #check if product already has tag
  def self.checkExist(prodID, tagID)
    tags = Product.find(prodID).tags
    if tags.include?(Tag.find(tagID))
      flash[info] = "Product and Tag already paired."
      redirect_to admins_dashboard_path
    end
  end

end
