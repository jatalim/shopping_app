class TagsController < ApplicationController

  def create
    tag_params = params[:tag].permit(:name)

    tag = Tag.new(tag_params)
    if tag.save
      flash[:info] = "Tag created!"
    else
      flash[:info] = "Tag not saved."
    end

    # Create product tagging with new tag, and product id
    # To be shifted to a service/model call
    productTag = ProductTagging.new(tag_id: tag.id, product_id: params[:product][:id])
    if productTag.save
      flash[:success] = "producttagging created"
    else
      flash[:success] = "producttagging saving not successful"
    end

    redirect_to product_path(id: params[:product][:id])
  end

  def update
    tag_params = params[:tag].permit(:name,:tag_id)
    tag = Tag.find(id: tag_params[:tag_id] )
    tag.name = tag_params[:name]
    tag.save
  end

  def destroy

  end

end
