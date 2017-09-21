class OilpricesController < ApplicationController
    
    def new
        @oilprice = Oilprice.new
    end
    
    def create
        @oilprice = Oilprice.new(oilprice_params)
        @oilprice.save
        redirect_to root_path
    end
    
    def edit
        @oilprice = Oilprice.first
    end
    
    def update
        @oilprice = Oilprice.first
        if (@oilprice.update(oilprice_params))
           flash[:now] = "Oil price update done"
           redirect_to root_path
        else
            flash[:now] = "Failed to update price"
            render :edit
        end
    end
        
    
    private
    def oilprice_params
        params.require(:oilprice).permit(:price)
    end
end
