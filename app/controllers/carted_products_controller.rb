class CartedProductsController < ApplicationController

  def index
    @cartedproducts = CartedProduct.where(public_user_id: current_public_user.id).order("created_at DESC")
  end

  def create
    
    cartedproduct_params = params[:carted_product].permit(:product_quantity,:product_id,:public_user_id)

    @cartProd = CartedProduct.new(cartedproduct_params)

    if @cartProd.save
      flash["info"] = "Product added to cart"
    else
      flash["info"] = "There was an error adding product to cart"
    end

    redirect_to root_path

  end

  def destroy

  end

end
