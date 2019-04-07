class MaintainsController < ApplicationController
    
    
    def create
        @truck = Truck.find(params[:maintain][:truck_id])
        @maintain = @truck.maintains.build(maintain_params)
        if (@maintain.save)
            his = @truck.truckhistories.build(truck_id: @truck.id,
                action: Time.now.strftime("%Y/%m/%d"), mileage: params[:maintain][:mileage])
            his.save
            flash[:success] = "Truck information Adjusted"
            redirect_to admin_url
        else
            flash[:error] = "Truck info not adjusted"
            render 'trucks/adjust'
            
        end
    end
    
    
    private
    
    def maintain_params
        params.require(:maintain).permit(:action, :mileage, :nextmileage, :content)
    end
end
