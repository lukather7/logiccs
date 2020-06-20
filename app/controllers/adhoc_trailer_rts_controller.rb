class AdhocTrailerRtsController < ApplicationController
    
    
   def show
        @trailer = Trailer.find(params[:id])
        @tirerotations = @trailer.adhocTrailerRts.order("created_at")
    end
    
    def new
        @trailer = Trailer.find(params[:trailer_id])
        @adhoc_tire = @trailer.adhocTrailerRts.build
    end
    
    
    def create
#        @trailer = Truck.find()
        @trailer = Trailer.find(params[:trailer_id])
        @trailer_tire = @trailer.adhocTrailerRts.build(tire_params)
        if (@trailer_tire.save)
            flash[:success] = "Tire Rotation Saved"
            redirect_to adhoc_trailer_rt_url(@trailer)
        else
            flash[:error] = "Tire Rotation Rejected"
            render :edit
        end
    end
    
    def edit
        @adhoc_tire = AdhocTrailerRt.find(params[:id])
        
        @trailer = @adhoc_tire.trailer
    end


    def update
        @trailer = Trailer.find(params[:trailer_id])
        
        @adhoc_tire = AdhocTrailerRt.find(params[:id])
        
        
        if (@adhoc_tire.update(tire_params))
          flash[:success] = "Tire Rotation Saved"
          redirect_to karteB_trailer_url(@trailer)
        else
           flash[:error] = "Tire Rotation Rejected"
           render :edit           
        end
    end

    
    private
    
     def tire_params
        params.require(:adhoc_trailer_rt).permit(
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
