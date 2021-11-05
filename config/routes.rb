Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :products

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: :new
  end

  get "/add_to_cart/:product_id", to: "products#add_to_cart"
  get "/buy/:product_id", to: "products#buy_directly"

  get "/cart", to: "pages#show_cart"


end

