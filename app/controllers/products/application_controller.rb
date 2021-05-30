class Products::ApplicationController < ApplicationController
   # before_action :authenticate_customer!
    
    before_action :require_customer_logged_in, only: [:create]
end