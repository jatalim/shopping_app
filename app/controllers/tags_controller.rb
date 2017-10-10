class TagsController < ApplicationController

  def create
    tag_params = params[:tag].permit(:name)

    tag = Tag.new(tag_params)
    if tag.save
      flash[:info] = "Tag created!"
    else
      flash[:info] = "Tag not saved."
    end
    
    redirect_to admins_dashboard_path

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
