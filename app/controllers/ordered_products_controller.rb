class OrderedProductsController < ApplicationController
	
	def new 
	@client_token = Braintree::ClientToken.generate
    	if !current_public_user.blank? #user logged in
       		@cartedproducts = CartedProduct.where(public_user_id: current_public_user.id)
    	else
       		redirect_to root_path #temporary redirect
    	end
	end 

	def create
    @payment = PaymentService.new(current_public_user).call  
    if @payment.success?
        @order = Order.create(:total => @payment.transaction.amount, :order_status_id => 2, :public_user_id => current_public_user.id)
        flash.now["info"] = "Transaction was a success"
    elsif
        flash["info"] = "Transaction processing error"
        redirect_to carted_products_path
    end  
  end 

  def subtotal 
    cartedproducts.collect { |cartprod| cartprod.product_quantity * cartprod.product_price }.sum 
  end 

end 
