class AdminsController < ApplicationController

    def dashboard

      @tag = Tag.new
      @productTagging = ProductTagging.new

      taglist = ProductTagging.select(:tag_id)
      @floatingTags = Tag.where.not(id: taglist)

      @products = Product.all

    	@pendingorders = Order.where(:order_status_id => 2)
    	@orders = Order.all

    end 


end 
