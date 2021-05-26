class Customer < ApplicationRecord
    before_save { self.email.downcase! }
    validates :family_name, presence: true, length: { maximum: 50 }
    validates :given_name, presence: true, length: { maximum: 50 }
    validates :family_kana, presence: true, length: { maximum: 50 }
    validates :given_kana, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
                    
    validates :sex, presence: true, length: { maximum: 3 }
    has_secure_password
    has_one :cart, dependent: :destroy
    
    def prepare_cart
     cart || create_cart
    end

end
