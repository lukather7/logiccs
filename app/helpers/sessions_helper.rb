module SessionsHelper
  def current_user
#    if (controller.controller_name == "dealeruser")
 #      @dcurrent_user ||= Dealeruser.find_by(id: session[:duser_id])
 #      @current_user = @dcurrent_user
 #    else 
      @current_user ||= User.find_by(id: session[:user_id])
 #   end
  end


  def dcurrent_user
    @dcurrent_user ||= Dealeruser.find_by(id: session[:duser_id])
  end


  def admin_user
    @admin_user ||= Admin.find_by(id: session[:admin_id])
  end

  def logged_in?
    !!current_user
  end

  def dlogged_in?
    !!dcurrent_user
  end
  
  def adminlogged_in?
    !!admin_user
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end