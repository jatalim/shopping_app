class PaymentService 

 def initialize(current_public_user) 
	@current_public_user = current_public_user
	@cartedproducts = CartedProduct.where(public_user_id: @current_public_user.id)
 end 

 def call 

 	@total_amount = @cartedproducts.collect { |cartprod| cartprod.product_quantity * cartprod.product_price }.sum 

    result = Braintree::Transaction.sale(
    :amount => @total_amount,
    :payment_method_nonce => 'fake-valid-nonce', 
    :options => {
    :submit_for_settlement => true
    }
  )
 end 

end 


 