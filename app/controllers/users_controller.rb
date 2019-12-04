class UsersController < ApplicationController
#  before_action :logged_in_user, only: [:show, :edit, :update, :list]
  before_action :logged_in_user, only: [:show, :list, :dashboard]
  
  before_action :adminlogged_in_user, only:[:adminsetuser]


  def index
    @users = User.all.order(:company_id, :name)
  end

  def new
    @companies = Company.preload(:branches)
    @branches =  (@user != nil) ? Branch.where(company_id: @user.company_id) : {}
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "登録完了"
    else
      @companies = Company.preload(:branches)
      @branches =  (@user != nil) ? Branch.where(company_id: @user.company_id) : {}
      
     render 'new'
    end
  end
  
  def show
    redirect_to controller: 'users', action: 'list', id: params[:id]
  end
  
  def list
    @user = User.find(params[:id])
    @mytrucks = @user.trucks
    @mytrailers = @user.trailers
  end
  
  def trailerlist
    @user = User.find(params[:id])
    @mytrailers = @user.trailers
  end  

  def dashboard
    @user = User.find(params[:id])
    @companies = Company.all
    @branches = (@user != nil) ? Branch.where(company_id: @user.company_id) : {}
    @mytrucks = @user.trucks
    @othertrucks = Truck.where(company_id: @user.company_id, branch_id: @user.branch_id) - @mytrucks

    @mytrailers = @user.trailers
    @othertrailers = Trailer.where(company_id: @user.company_id, branch_id: @user.branch_id) - @mytrailers
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:danger] = "Update Failed"
      render :edit
    end
  end
  
  def admin_setuser
    @user = User.find(params[:id])
    session[:user_id] = @user.id
    redirect_to @user
  end
  
  private

  def user_params
    params.require(:user).permit(:company_id, :branch_id, :name, :email,
                    :password, :password_confirmation)
  end 
end
