class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :use_key
      t.string :sex
      t.integer :birthday_year
      t.integer :birthday_month
      t.integer :birthday_day
      t.string :family_name
      t.string :given_name
      t.string :family_kana
      t.string :given_kana
      t.string :email
      t.string :password_digest
      t.string :zip
      t.string :pref
      t.string :addr
      t.string :addr2
      t.string :addr3
      t.integer :tel

      t.timestamps
    end
  end
end
