class TruckrelationshipsController < ApplicationController
    
    def create
        @user = User.find(params[:truckrelationship][:user_id])
        @user.truck_add(  params[:truckrelationship][:truck_id])
        redirect_to @user
    end
    
    def destroy
        @user = User.find(params[:truckrelationship][:user_id])
        t = Truckrelationship.find(params[:id])
        t.destroy if (t != nil)
        return redirect_to @user if @user !=nil
        redirect_to root_url
    end
end
