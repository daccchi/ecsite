class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :customer, index: true, unique: true, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
