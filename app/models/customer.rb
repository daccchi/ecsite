class Customer < ApplicationRecord
 
 include Hashid::Rails

 
 
 
    before_save { self.email.downcase! }
    validates :family_name, presence: true, length: { maximum: 50 }
    validates :given_name, presence: true, length: { maximum: 50 }
   # validates :family_kana, presence: true, length: { maximum: 50 }
   # validates :given_kana, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
                    
    #validates :sex, presence: true, length: { maximum: 3 }
    
    #validates :birthday_year, presence: true, length: { maximum: 15 }, numericality: { only_integer: true }
    #validates :birthday_month, presence: true, length: { maximum: 3}, numericality: { only_integer: true }
    #validates :birthday_day, presence: true, length: { maximum: 3 }, numericality: { only_integer: true }
    
    # validates :zip, presence: true, length: { maximum: 7 }, numericality: { only_integer: true }
    #  validates :pref, presence: true, length: { maximum: 10 }
      # validates :addr, presence: true, length: { maximum: 10 }
       # validates :addr2, presence: true, length: { maximum: 10 }
        
    #validates :tel, presence: true, length: { maximum: 15 }, numericality: { only_integer: true }
       
    has_secure_password
    has_one :cart, dependent: :destroy
    
    def prepare_cart
     cart || create_cart
    end
    
    

end
