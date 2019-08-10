class AdminController < ApplicationController

  before_action :adminlogged_in_user, only:[:setuser]

  def new
     
  end
  
  def create
      @admin = Admin.find_by(email: params[:admin][:email].downcase)
      if @admin && @admin.authenticate(params[:admin][:password])
        session[:admin_id] = @admin.id
        flash[:info] = "logged in as Admin- #{@admin.name}"
        redirect_to adminpanel_url
      else
        flash[:danger] = 'invalid email/password combination'
        render 'new'
      end
  end
  
  def newadmin
    @admin = Admin.new
  end
  
  def createadmin
    @admin = Admin.new(admin_params)
    
    if (@admin.save)
      flash[:success] = "New Admin user created"
      redirect_to adminpanel_url
    else
      flash[:error] = "Admin user failed to create"
      render 'newadmin'
    end
  end

  def index
      
  end

  def setuser
    @users = User.all.includes(:company)
    company_ids = @users.map {|u| u.company_id}.uniq!.sort!
    @companys = Company.find(company_ids)
  end

  private
  
  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end

end
