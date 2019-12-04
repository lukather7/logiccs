class TrailertirehistoriesController < ApplicationController
    
    def new
       @trailer = Trailer.find(params[:trailer_id])
       @index = params[:index]
       @tirehistory = @trailer.tirehistories.build(index: @index)
    end
    
    def create
        @tirehistory = Trailertirehistory.new(trailertirehistory_params)
        if (@tirehistory.save)
           # 保存成功o
           redirect_to karte_trailer_url(@tirehistory.trailer)
        else
    　　　 # 保存失敗
        end
    end

    def edit
        @tirehistory = Trailertirehistory.find(params[:id])
        @trailer = @tirehistory.trailer
        @index = @tirehistory.index
    end
    
    def update
        @tirehistory = Trailertirehistory.new(trailertirehistory_params)
        
        
        if (@tirehistory.save)
            flash[:success] = "Trailer Tire History updated"
            redirect_to karte_trailer_url(@tirehistory.trailer)
        else

        end
    end

 private

    def trailertirehistory_params
       params.require(:trailertirehistory).permit(:trailer_id, :index, :serialno, :purchasedate) 
    end
    
end
