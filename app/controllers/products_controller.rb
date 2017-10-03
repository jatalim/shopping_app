class ProductsController < ApplicationController

    def index
      @products = Product.all
    end 

    def new
      @product = Product.new
    end

    def create
      product_params = params[:product].permit(:name,:description,:price,:quantity,:image)
      @product = Product.new(product_params)

      if @product.save
          flash["info"] = "Product successfully created"
          redirect_to root_path
      else
          flash["info"] = "There was an error saving your product"
          render :new
      end
    end

    def destroy

    end

end 
