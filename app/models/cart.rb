class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  
  def total_price
    total_jpy_price
  end
  
  private
  
  def total_jpy_price
    jp_products=products.where('price>=0')
    jp_products.sum(:price)
  end
  
  
end
