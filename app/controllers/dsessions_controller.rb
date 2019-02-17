class DsessionsController < ApplicationController
  def new
  end

  def create
    @duser = Dealeruser.find_by(email: params[:dsession][:email].downcase)
 #   binding.pry
    if @duser && @duser.authenticate(params[:dsession][:password])
      session[:duser_id] = @duser.id
      flash[:info] = "logged in as #{@duser.name}"
      redirect_to dealeruser_url(@duser)
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:duser_id] = nil
    redirect_to root_path
  end
end