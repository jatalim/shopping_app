class CartedProductsController < ApplicationController

  def index
    @updateProducts = CartedProduct.new
    if !current_public_user.blank? #user logged in
       @cartedproducts = CartedProduct.where(public_user_id: current_public_user.id).order("created_at")
    else
       redirect_to root_path #temporary redirect
    end
  end

  def create

    @cartProd = CartedProduct.new(cartedproduct_params)
    prodName = Product.find(cartedproduct_params[:product_id]).name

    cartedproduct_params = params[:carted_product].permit(:product_quantity,:product_id,:public_user_id, :product_price)

    # check if product already exists in shopping cart
    @cartedproducts = CartedProduct.where(public_user_id: current_public_user.id)
    if @cartedproducts.any? {|cartprod| (cartprod.product_id).to_s == cartedproduct_params[:product_id]}
      
       @cartprod = @cartedproducts.find_by(product_id: cartedproduct_params[:product_id])
       @cartprod.product_quantity += cartedproduct_params[:product_quantity].to_i
       @cartprod.product_price = cartedproduct_params[:product_price]

    else #this product type hasnt been added yet to cart
      @cartprod = CartedProduct.new(cartedproduct_params)
    end

    if @cartprod.save

      flash.now["info"] = "#{cartedproduct_params[:product_quantity]} #{prodName}(s) added to cart"
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
          messageStr = "Cart details updated"
        else
          messageStr += "There was an error updating cart details for cart item #{@cartprod.name}, id #{@cartprod.id} /n"
        end

    end
        flash["info"] = messageStr

        redirect_to carted_products_path
  end

  def destroy
      @updateProducts = CartedProduct.new
      @cartedproduct = CartedProduct.find(params[:id])

      cartProdName = Product.find(@cartedproduct.product_id).name
      @cartprod = @cartedproduct
      @cartedproduct.destroy
      @cartedproducts = CartedProduct.where(public_user_id: current_public_user.id)

      flash[:info] = "#{cartProdName} removed from cart"


      respond_to do |format|
        format.js
      end

  end

  def clearCart

    @cartedproducts = CartedProduct.where(public_user_id: current_public_user.id)
    @cartedproducts.destroy_all
    @updateProducts = CartedProduct.new

    flash[:info] = "Cart items cleared!"

    respond_to do |format|
        format.js
    end

  end

end

