Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :products

  resources :orders, only: [:index, :show, :create, :update] do
    resources :payments, only: :new
  end

  get "/cart", to: "carts#show"

  resources :carts, only: [:show] do
    resources :cart_items, only: [:destroy]
  end

end

