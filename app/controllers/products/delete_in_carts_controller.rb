class Products::DeleteInCartsController < Products::ApplicationController
  def create
    cart = current_customer.prepare_cart
    product = Product.find(params[:product_id])
    
    cart_product = cart.cart_items.find_by(product_id: product.id)
    cart_product.destroy!
    
    redirect_to cart_path
  end
end