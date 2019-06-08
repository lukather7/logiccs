class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include SessionsHelper
  include DealersessionsHelper

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def dlogged_in_user
    unless dlogged_in? && @dcurrent_user
      store_location
      flash[:danger] = "Please log in."
      redirect_to dlogin_url
    end
  end
  
  def adminlogged_in_user
    unless adminlogged_in? && @admin_user
      store_location
      flash[:danger] = "Please log in."
      redirect_to admin_url
    end
  end
  
  
  def logged_in_dealeruser
    unless dealer_logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end    
  end
end
