class CartsController < ApplicationController
  #before_action :authenticate_customer!
  
  def show
    cart = current_customer.prepare_cart
    @product = cart.products
    
    @total_price = cart.total_price
  end
  
end
