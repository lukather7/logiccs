class LoginotesController < ApplicationController
# before_action :logged_in_user, only: [:create]

 def new
 end
 
 def create
   @truck = Truck.find(params[:loginote][:truck_id])
   @loginote = @truck.loginotes.build(loginote_params)
   if @loginote.save
       flash[:success] = "Loginote created"
       redirect_to  karte_path(@truck.id)
   else
       render 'loginotes/form'
   end
 end
 
 private
 def loginote_params
    params.require(:loginote).permit(:content)
 end  
end