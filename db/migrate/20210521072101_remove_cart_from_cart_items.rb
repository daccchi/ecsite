class RemoveCartFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_reference :cart_items, :cart, foreign_key: true
  end
end
