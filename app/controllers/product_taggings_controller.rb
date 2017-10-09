class ProductTaggingsController < ApplicationController

    def create

      productTag_params = params[:product_tagging].permit(:product_id,:tag_id)
      prodID = productTag_params[:product_id]
      tagID = productTag_params[:tag_id]

      ProductTagging.checkExist(prodID,tagID)

      productTag = ProductTagging.new(tag_id: tagID, product_id: prodID)

      tagName = Tag.find(tagID).name
      prodName = Product.find(prodID).name

      if productTag.save
        flash[:success] = "#{tagName} assigned to #{prodName}"
      else
        flash[:success] = "producttagging saving not successful"
      end

      redirect_to admins_dashboard_path

    end


end
