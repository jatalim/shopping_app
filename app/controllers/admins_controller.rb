class AdminsController < ApplicationController

    def dashboard
      @tag = Tag.new
      @productTagging = ProductTagging.new

      taglist = ProductTagging.select(:tag_id)
      @floatingTags = Tag.where.not(id: taglist)

      @products = Product.all
    end 


end 
