class AdminsController < ApplicationController

    def dashboard
    	@pendingorders = Order.where(:order_status_id => 2)
    	@orders = Order.all
    end 


end 
