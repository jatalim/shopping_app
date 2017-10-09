class OrdersController < ApplicationController
	def create 
		order_params = params[:order].permit[:subtotal, :shipping, :total]
		order = Order.create(order_params)
	end 

	def new 
		@order = Order.new 
	end 

	def edit
		@order = Order.find(params[:id])
	end 

	def update
		order_params = params[:order].permit(:order_status_id)
		@order = Order.find(params[:id])
		@order.update(order_params)
		if @order.save 
			flash[:success] = "Order successfully updated"
			OrderMailer.order_mailer(@order).deliver_later
			redirect_to admins_dashboard_path
		else 
			flash[:danger] = "Error in updating order"
		end
	end 

end 