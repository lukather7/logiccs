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
    @trailers = Trailer.all.order(:company_id).order(:branch_id).order(:wheels).order(:vehicleid).page(params[:page])
  end
  
  def destroy
    @trailer = Trailer.find(params[:id])
    @trailer.destroy if @trailer
    redirect_to trailers_url
  end

  def tirerotation
    @trailer = Trailer.find(params[:id])
    @hist_ar = Array.new
    @hist_ar <<  @trailer.tirehistories.where(index: 0).last
    @hist_ar <<  @trailer.tirehistories.where(index: 1).last
    @hist_ar <<  @trailer.tirehistories.where(index: 2).last
    @hist_ar <<  @trailer.tirehistories.where(index: 3).last
    @hist_ar <<  @trailer.tirehistories.where(index: 4).last
    @hist_ar <<  @trailer.tirehistories.where(index: 5).last
    @hist_ar <<  @trailer.tirehistories.where(index: 6).last
    @hist_ar <<  @trailer.tirehistories.where(index: 7).last
    @hist_ar <<  @trailer.tirehistories.where(index: 8).last
    if (@trailer.wheels.to_i == 12)
      @hist_ar <<  @trailer.tirehistories.where(index: 9).last
      @hist_ar <<  @trailer.tirehistories.where(index: 10).last
      @hist_ar <<  @trailer.tirehistories.where(index: 11).last
      @hist_ar <<  @trailer.tirehistories.where(index: 12).last
    end
    
    if (@trailer.wheels.to_i == 12)
        render :rotation_12
    elsif (@trailer.wheels.to_i == 8)
        render :rotation_8
    elsif (@trailer.wheels == "FULL")
        render :rotation_full
    else
    end
  end
  
  def karte
    @trailer = Trailer.find(params[:id])
    wheels = @trailer.wheels

    @hist_ar = Array.new
    @hist_ar <<  @trailer.tirehistories.where(index: 0).last
    @hist_ar <<  @trailer.tirehistories.where(index: 1).last
    @hist_ar <<  @trailer.tirehistories.where(index: 2).last
    @hist_ar <<  @trailer.tirehistories.where(index: 3).last
    @hist_ar <<  @trailer.tirehistories.where(index: 4).last
    @hist_ar <<  @trailer.tirehistories.where(index: 5).last
    @hist_ar <<  @trailer.tirehistories.where(index: 6).last
    @hist_ar <<  @trailer.tirehistories.where(index: 7).last
    @hist_ar <<  @trailer.tirehistories.where(index: 8).last
    if (@trailer.wheels.to_i == 12)
      @hist_ar <<  @trailer.tirehistories.where(index: 9).last
      @hist_ar <<  @trailer.tirehistories.where(index: 10).last
      @hist_ar <<  @trailer.tirehistories.where(index: 11).last
      @hist_ar <<  @trailer.tirehistories.where(index: 12).last
    end
    
    if (wheels == "8")
      render 'rotation_8'
    elsif (wheels == "12")
      render 'rotation_12'
    else
      render 'rotation_full'
    end
  end
  
  def karteB
    @trailer = Trailer.find(params[:id])
    wheels = @trailer.wheels
  end

    
private
  def trailer_params
    params.require(:trailer).permit(:company_id, :branch_id,
             :wheels, :vehicleid, :number, :tire, :purchase,
             :image, :dealercompany_id)

  end
    
    
end
