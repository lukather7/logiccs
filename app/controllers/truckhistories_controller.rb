class TruckhistoriesController < ApplicationController
    def create
        t = Truckhistory.new(hist_params)
#        binding.pry
        if (t.save)
            redirect_to current_user
        else
            redirect_to current_user, alert: "failed to update"
        end
    end
    
    private
    
    def hist_params
        params.require(:truckhistory).permit(:truck_id, :action, :mileage)
    end
end
