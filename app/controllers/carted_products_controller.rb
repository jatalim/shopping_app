class CartedProductsController < ApplicationController


  def index

    @updateProducts = CartedProduct.new

    if !current_public_user.blank? #user logged in
       @cartedproducts = CartedProduct.where(public_user_id: current_public_user.id).order("created_at DESC")
    else
       redirect_to root_path #temporary redirect
    end
  end


  def create
    
    cartedproduct_params = params[:carted_product].permit(:product_quantity,:product_id,:public_user_id)

    @cartProd = CartedProduct.new(cartedproduct_params)

    if @cartProd.save
      flash.now["info"] = "Product added to cart"
      respond_to do |format|
        format.js {}
        
      end
    else
      flash["info"] = "There was an error adding product to cart"
    end

    

  end

  def update

  end

  def updateQuantity

    # for each cartedproduct, call update with the new product_quantity.
    messageStr = ""
    params[:carted_product].each do |id, qty|

        @cartprod = CartedProduct.find(id)
        @cartprod.product_quantity = qty
        @cartprod.save

        if @cartprod.save
          messageStr += "Cart details updated /n"
        else
          messageStr += "There was an error updating cart details for cart item #{@cartprod.name}, id #{@cartprod.id} /n"
        end

    end
        flash["info"] = messageStr

        redirect_to carted_products_path

  end

  def destroy
      @cartedproduct = CartedProduct.find(params[:id])
      @cartedproduct.destroy

      flash[:info] = "Product removed from cart"

      redirect_to carted_products_path

  end

end
