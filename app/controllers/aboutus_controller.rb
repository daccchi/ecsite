class AboutusController < ApplicationController
  def index
    cart = current_customer.prepare_cart
    @product = cart.products
    @count_products = cart.products.count
  end
end
