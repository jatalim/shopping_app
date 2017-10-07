class PaymentService 

 def initialize(current_public_user) 
	@current_public_user = current_public_user
	@cartedproducts = CartedProduct.where(public_user_id: @current_public_user.id)
 end 

 def call 
	@cartedproducts.each do |cartprod|
	@product = Product.find(cartprod.product_id)
	@total = @product.price*cartprod.product_quantity
	end 
	@total_amount = @cartedproducts.sum(@total)

    result = Braintree::Transaction.sale(
    :amount => @total_amount,
    :payment_method_nonce => 'fake-valid-nonce', 
    :options => {
    :submit_for_settlement => true
    }
  )
 end 

end 


 