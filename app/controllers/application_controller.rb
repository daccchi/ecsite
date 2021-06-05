class ApplicationController < ActionController::Base
    
    helper_method :current_customer
    helper_method :logged_in
    
    def logged_in?
    !!current_customer
    
    end
  
  
  def counts
    @count_products = cart.products.count
  end
  
  def current_customer
    @current_customer ||= Customer.find_by(id: session[:customer_id])
  end
  
  private

  def require_customer_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  
end