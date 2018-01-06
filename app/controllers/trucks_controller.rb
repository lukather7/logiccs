class TrucksController < ApplicationController

  def index
    @trucks = Truck.all.order(:company_id, :branch_id)
  end
    
  def new
    @companies = Company.preload(:branches)
    @branches =  (@user != nil) ? Branch.where(company_id: @user.id) : {}
    @truck = Truck.new
  end
  
  def create
    @truck = Truck.new(truck_params)
    if (@truck.save)
      if @truck.initmileage.present?
          @truck_history = @truck.truckhistories.build(
            truck_id: @truck.id, action: Time.now,
            mileage: @truck.initmileage)
          @truck_history.save
      end
      redirect_to @truck
    else
     @companies = Company.preload(:branches)
     @branches =  (@user != nil) ? Branch.where(company_id: @user.id) : {}

      flash.now[:alert] = "failed to register"
      render 'new'
    end
  end
  
  def edit
    @truck = Truck.find(params[:id])
    @companies = Company.preload(:branches)
    @branches =  Branch.where(company_id: @truck.id)
  end
  
  def update
    @truck = Truck.find(params[:id])
    @companies = Company.preload(:branches)
    @branches =  Branch.where(company_id: @truck.id)
    if (@truck.update(truck_params))
      redirect_to @truck
    else
      flash[:now] = "Truck update error"
      render 'edit'
    end
  end
  
  def initset
    # To view Truck Initial Mileage form
    @truck = Truck.find(params[:id])  
  end
  
  def recordinit
    @truck = Truck.find(params[:truckhistory][:truck_id])
    initmileage = params[:truckhistory][:mileage]
    @truck.update(initmileage: initmileage)
    @t_histories = @truck.truckhistories
    @t_histories.each {|t|
      t.destroy if t != nil
    }
    th = Truckhistory.new(truck_id: @truck.id, mileage: initmileage)
    if th.save
      redirect_to edit_truck_path(@truck)
    else
      render 'initset'
    end
  end

  def record
    @truck = Truck.find(params[:id])
  end

  def show
    @truck = Truck.find(params[:id])
  end
  
  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy if (@truck)
    redirect_to trucks_url
  end
  
private
  def truck_params
    params.require(:truck).permit(:company_id, :branch_id,
             :maker, :model, :body, :wheels, :engine, :vehicleid,
             :number, :purchase, :e_oil, :tm_oil, :tire, :df_oil, :initmileage,
             :image)

  end
end