class TirehistoriesController < ApplicationController
    
    def new
       @truck = Truck.find(params[:truck_id])
       @index = params[:index]
       @tirehistory = @truck.tirehistories.build(index: @index)
    
    end
    
    def create
        @tirehistory = Tirehistory.new(tirehistory_params)
        if (@tirehistory.save)
           # 保存成功o
           redirect_to tirerotation_truck_url(@tirehistory.truck)
        else
    　　　 # 保存失敗
        end
    end

    def edit
        @tirehistory = Tirehistory.find(params[:id])
        @truck = @tirehistory.truck
        @index = @tirehistory.index
    end
    
    def update
        @tirehistory = Tirehistory.new(tirehistory_params)
        
        
        if (@tirehistory.save)
            flash[:success] = "Tire History updated"
            redirect_to tirerotation_truck_url(@tirehistory.truck)
        else

        end
    end

 private

    def tirehistory_params
       params.require(:tirehistory).permit(:truck_id, :index, :serialno, :purchasedate) 
    end
    
end
