class Products::AddToCartsController < ApplicationController
  
  before_action :require_customer_logged_in, only: [:create]

  def create
    cart = current_customer.prepare_cart
    product = Product.find(params[:product_id])
    cart.cart_items.create!(product_id: product.id)
    
    redirect_to cart_path
  end
end