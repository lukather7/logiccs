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
            :tire1sn, :tire1depthmiddle, :tire1depthside, :tire1purchase,
            :tire2sn, :tire2depthmiddle, :tire2depthside, :tire2purchase,
            :tire3sn, :tire3depthmiddle, :tire3depthside, :tire3purchase,
            :tire4sn, :tire4depthmiddle, :tire4depthside, :tire4purchase,
            :tire5sn, :tire5depthmiddle, :tire5depthside, :tire5purchase,
            :tire6sn, :tire6depthmiddle, :tire6depthside, :tire6purchase,
            :tire7sn, :tire7depthmiddle, :tire7depthside, :tire7purchase,
            :tire8sn, :tire8depthmiddle, :tire8depthside, :tire8purchase,
            :tire9sn, :tire9depthmiddle, :tire9depthside, :tire9purchase,
            :tire10sn, :tire10depthmiddle, :tire10depthside, :tire10purchase,
            :tire11sn, :tire11depthmiddle, :tire11depthside, :tire11purchase,
            :tire12sn, :tire12depthmiddle, :tire12depthside, :tire12purchase,
            :tire13sn, :tire13depthmiddle, :tire13depthside, :tire13purchase,
        )
     end
    
end
