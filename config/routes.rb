Rails.application.routes.draw do
  namespace :webhooks do
    post :stripe,     to: "stripe#create"
    post :pagseguro,  to: "pagseguro#create"
  end
  resource  :profile,  only: :show
  resources :addresses, except: :show
  resources :orders, only: %i[index show]
  namespace :checkout do
    resources :addresses, only: %i[new create]
    resources :payments,  only: %i[new create]
    resource  :order,     only: %i[show] do
      get :success
      get :cancel
    end
  end
  resource  :cart,       only: :show          # singular – um carrinho por usuário
  resources :line_items, only: %i[create update destroy]

  root "pages#home"

  get "/about",   to: "pages#about"
  get "/faq",     to: "pages#faq"
  get "/contact", to: "pages#contact"

  resources :products, only: %i[index show]
  resources :categories, only: :show
  resources :brands,     only: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


end
