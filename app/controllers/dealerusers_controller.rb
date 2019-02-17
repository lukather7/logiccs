class DealerusersController < ApplicationController
#  before_action :logged_in_user, only: [:show, :edit, :update, :list]
  before_action :dlogged_in_user, only: [:show, :list, :dashboard]

  def index
    @dealerusers = Dealeruser.all.order(:dealercompany_id, :name)
  end

  def new
    @companies = Dealercompany.preload(:dealerbranches)
    @branches =  (@dealeruser != nil) ? Dealerbranch.where(dealercompany_id: @dealeruser.dealercompany_id) : {}
    @dealeruser = Dealeruser.new
  end

  def create
    @dealeruser = Dealeruser.new(dealeruser_params)
    if @dealeruser.save
      session[:user_id] = @dealeruser.id
      redirect_to admin_path, notice: "登録完了"
    else
      @companies = Dealercompany.preload(:dealerbranches)
      @branches =  (@dealeruser != nil) ? Dealerbranch.where(dealercompany_id: @dealeruser.dealercompany_id) : {}
      
     render 'new'
    end
  end
  
  def show
   # redirect_to controller: 'dealerusers', action: 'list', id: params[:id]
   @duser = dcurrent_user
   @dcompany = @duser.dealercompany
   @logithreads = Logithread.where(dealercompany_id: @dcompany.id).order("created_at DESC")
  end
  
  def list
    @dealeruser = DealerUser.find(params[:id])
    @mytrucks = @dealeruser.trucks
  end

  def dashboard
    @dealeruser = DealerUser.find(params[:id])
    @companies = Company.all
    @branches = (@dealeruser != nil) ? Dealerbranch.where(dealercompany_id: @dealeruser.dealercompany_id) : {}
  end

  def edit
    @dealeruser = Dealeruser.find(params[:id])
  end
  
  def update
    @dealeruser = Dealeruser.find(params[:id])
    if @dealeruser.update(user_params)
      redirect_to @dealeruser
    else
      flash.now[:danger] = "Update Failed"
      render :edit
    end
  end
  
  def destroy
    @dealeruser = Dealeruser.find(params[:id])
    @dealeruser.destroy if (@dealeruser)
    redirect_to dealerusers_path
  end
  
  private

  def dealeruser_params
    params.require(:dealeruser).permit(:dealercompany_id, :dealerbranch_id, :name, :email,
                    :password, :password_confirmation)
  end 
end
