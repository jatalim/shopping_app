class OrderMailer < ApplicationMailer

	def order_mailer(order)
		@order = order
		@publicuser = @order.public_user
			if @order.order_status_id != 4
   			else 
   				mail(to: @publicuser.email, subject: "Your Order has been delivered!")
   		end 
	end 

end 

