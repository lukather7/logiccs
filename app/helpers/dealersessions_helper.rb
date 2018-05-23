module DealersessionsHelper
  def current_dealer_user
    @current_user ||= DealerUser.find_by(id: session[:dealeruser_id])
  end

  def dealer_logged_in?
    !!current_dealer_user
  end

end