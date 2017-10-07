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
    call = PaymentService.new(current_public_user).call  
    if call.success?
      flash.now["info"] = "Braintree was a success"
      redirect_to root_path
    elsif
     flash.now["info"] = "Transaction processing error"
    end  
  end 

end 
