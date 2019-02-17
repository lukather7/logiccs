module DealersessionsHelper
  def current_dealer_user
    @current_user ||= Dealeruser.find_by(id: session[:duser_id])
  end

  def dealer_logged_in?
    !!current_dealer_user
  end

end