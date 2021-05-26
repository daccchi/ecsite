class ToppagesController < ApplicationController
  def index
    @product1 = Product.find(1)
   @product2 = Product.find(2)
   @product3 = Product.find(3)
   @product4 = Product.find(4)
  end
end
