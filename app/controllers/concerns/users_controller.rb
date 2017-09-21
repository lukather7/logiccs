class UsersController < ApplicationController
  
  def new
    @companies = Company.preload(:branches)
    @branches =  (@user != nil) ? Branch.where(company_id: @user.id) : {}
    @user = User.new
  end
  
  def create
  end
  
end
