class TrailersController < ApplicationController
    
    
    def new
        @companies = Company.preload(:branches)
        @branches =  (@user != nil) ? Branch.where(company_id: @user.id) : {}
        @trailer = Trailer.new
    end

    def create
        @trailer = Trailer.new(trailer_params)
        if (@trailer.save)
          flash.now[:success] = "New Trailer registered!!"

          redirect_to @trailer
        else
         @companies = Company.preload(:branches)
         @branches =  (current_user != nil) ? Branch.where(company_id: current_user.company.id) : {}
        
          flash.now[:alert] = "failed to register"
          render 'new'
        end
    end    
    
    
    def show
        @trailer = Trailer.find(params[:id])

    end
    
  def edit
    @trailer = Trailer.find(params[:id])
    @companies = Company.preload(:branches)
    @branches =  Branch.where(company_id: @trailer.company.id)
  end
  

  def update
    @trailer = Trailer.find(params[:id])
    @companies = Company.preload(:branches)
    @branches =  Branch.where(company_id: @trailer.company.id)
    if (@trailer.update(trailer_params))
      redirect_to @trailer
    else
      flash[:now] = "Truck update error"
      render 'edit'
    end
  end  
  
  def index
    @trailers = Trailer.all.order("company_id and branch_id and wheels and vehicleid").page(params[:page])
  end
  
  def destroy
    @trailer = Trailer.find(params[:id])
    @trailer.destroy if @trailer
    redirect_to trailers_url
  end
    
private
  def trailer_params
    params.require(:trailer).permit(:company_id, :branch_id,
             :wheels, :vehicleid, :number, :tire, :purchase,
             :image, :dealercompany_id)

  end
    
    
end
