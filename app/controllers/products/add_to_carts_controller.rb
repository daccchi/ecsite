class Products::AddToCartsController < ApplicationController

  def create
    cart = current_customer.prepare_cart
    product = Product.find(params[:product_id])
    cart.cart_items.create!(product_id: product.id)
    
    redirect_to cart_path
  end
end