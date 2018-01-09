class LaborcostsController < ApplicationController

def index
    @companies = Company.all
    @costs = Laborcost.all.order(:company_id, :model)
end

def new
    @companies = Company.all
    @cost = Laborcost.new
end

def create
    @cost = Laborcost.new(laborcost_params)
    @cost.save
    redirect_to laborcosts_path
end

def edit
    @companies = Company.all
    @cost = Laborcost.find(params[:id])
end

def update
    @cost = Laborcost.find(params[:id])
    @cost.update(laborcost_params)
    redirect_to laborcosts_path
end

def destroy
    @cost = Laborcost.find(params[:id])
    @cost.destroy
    redirect_to laborcosts_path
end

private

   def laborcost_params
       params.require(:laborcost).permit(:company_id, :model, :category, :oil_filter, :fuel_filter, :ps_oil,
:tm_oil, :df_oil, :air_filter, :air_drier, :break_oil, :clutch_oil,
:coolant, :grease, :cng_filter, :spark_plug, :clutch_kit, :battery,
:filter_ps_oil, :timing_belt_eg, :timing_belt_ac, :filter_axle,
:softwasher, :gasket_front_wheel, :gasket_rear_wheel, 
:seal_oil_front_wheel, :wheel_grease )
   end

end