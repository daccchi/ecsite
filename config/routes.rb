Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'aboutus',to: 'aboutus#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'customers#new'
  resources :customers, only: [:show, :create]
  
 resources :products
    
resource :cart, only: [:show]
  
  
  
  
  get '/my_cart' => 'carts#my_cart'
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'
  
  
  
end