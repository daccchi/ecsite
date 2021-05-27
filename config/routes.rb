
Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'aboutus',to: 'aboutus#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'customers#new'
  resources :customers, only: [:show, :create]
  
  resource :cart, only: %i(show)
  resource :charge, only: %i(create)
  
  get 'products', to: 'products#index'
  resources :products, only: %i(new show create) do
    scope module: :products do
      resources :add_to_carts, only: %i(create)
      resources :delete_in_carts, only: %i(create)
    end

 end
end
