Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:index, :show]
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  post '/orders/submit', to: 'orders#submit'

  mount StripeEvent::Engine, at: '/stripe-webhooks'



end

