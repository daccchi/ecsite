class ChargesController < ApplicationController
  def create
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    token = params[:stripeToken]
    product_ids = params[:product_ids].map(&:to_i)
    
    products = current_customer.cart.products.where(id: product_ids)
    total_jpy = products.sum(:price)
    #total_usd = products.where(unit: :usd).sum(:price)
    total = total_jpy 
    
    
    cart_products = current_customer.cart.cart_items.where(product_id: product_ids)
    cart_products.each(&:destroy!)
    
    Stripe::Charge.create({
      amount: total,
      currency: 'jpy',
      description: 'Example charge',
      source: token
    })
    redirect_to complete_path, notice: '決済に成功しました'
  end
end