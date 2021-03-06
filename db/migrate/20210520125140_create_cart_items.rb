class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      
      t.references :cart, index: true, null: false, foreign_key: true
      t.references :product, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
