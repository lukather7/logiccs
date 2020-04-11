class AdhocTruckRtsController < ApplicationController
    
    
    def index
    end
    
    def show
        @truck = Truck.find(params[:id])
        @tirerotations = @truck.adhocTruckRts.order("created_at")
    end
    
    def new
        @truck = Truck.find(params[:truck_id])
        @adhoc_tire = @truck.adhocTruckRts.build
    end
    
    def create
#        @truck = Truck.find()
        @truck = Truck.find(params[:truck_id])
        @truck_tire = @truck.adhocTruckRts.build(tire_params)
        if (@truck_tire.save)
            flash[:success] = "Tire Rotation Saved"
            redirect_to adhoc_truck_rt_url(@truck)
        else
            flash[:error] = "Tire Rotation Rejected"
            render :new
        end
    end
    
    def edit
        @adhoc_tire = AdhocTruckRt.find(params[:id])
        @truck = @adhoc_tire.truck
    end
    
    
    def update
        
        @adhoc_tire = AdhocTruckRt.find(params[:id])
        
        if (@adhoc_tire.update(tire_params))
            flash[:success] = "Tirelist Updated"
            @truck = @adhoc_tire.truck
            redirect_to adhoc_truck_rt_url(@truck)
        else
            flash[:error] = "Tirelist Failed to update"
            redirect_to adhoc_truck_rt_url(@truck)
            
        end

    end
    
    
    
    private
    
     def tire_params
        params.require(:adhoc_truck_rt).permit(
            :mileage, :date,
            :tire1sn, :tire1depth, :tire1purchase,
            :tire2sn, :tire2depth, :tire2purchase,
            :tire3sn, :tire3depth, :tire3purchase,
            :tire4sn, :tire4depth, :tire4purchase,
            :tire5sn, :tire5depth, :tire5purchase,
            :tire6sn, :tire6depth, :tire6purchase,
            :tire7sn, :tire7depth, :tire7purchase,
            :tire8sn, :tire8depth, :tire8purchase,
            :tire9sn, :tire9depth, :tire9purchase,
            :tire10sn, :tire10depth, :tire10purchase,
            :tire11sn, :tire11depth, :tire11purchase,
            :tire12sn, :tire12depth, :tire12purchase,
            :tire13sn, :tire13depth, :tire13purchase,
        )
     end
    
end
