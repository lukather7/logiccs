class TrailerrelationshipsController < ApplicationController
    
    def create
        @user = User.find(params[:trailerrelationship][:user_id])
        @user.trailer_add(params[:trailerrelationship][:trailer_id])
     #   redirect_to @user
        redirect_to :back 
    end
    
    def destroy
        @user = User.find(params[:trailerrelationship][:user_id])
        t = Trailerrelationship.find(params[:id])
        t.destroy if (t != nil)
     #   return redirect_to @user if @user !=nil
        redirect_to :back 
    end
end
