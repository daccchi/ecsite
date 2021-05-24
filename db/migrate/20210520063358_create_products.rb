class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :comment
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
