class AdminsController < ApplicationController

    def dashboard
      @productTag = ProductTagging.new
    end 


end 
