class ProductsController < ApplicationController
before_action :authenticate_admin!,  only: [:new, :edit, :create, :update]

    def index
      @products = Product.all
    end 

    def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
    end 

    def edit
      @product = Product.find(params[:id])
    end 

    def update 
      product_params = params[:product].permit(:name,:description,:price,:quantity,:image)
      @product = Product.find(params[:id])
      @product.update(product_params)
      redirect_to products_path
    end 

    def new
      @product = Product.new
    end

    def show 
      @product = Product.find(params[:id])
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

end 
