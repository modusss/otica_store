Rails.application.routes.draw do
  # ---------- PÚBLICO ----------
  root "pages#home"

  #   Devise (usuário da loja)
  devise_for :users

  #   Catálogo e conteúdo
  resources :products,   only: %i[index show]
  resources :categories, only: :show
  resources :brands,     only: :show

  get "/about",   to: "pages#about"
  get "/faq",     to: "pages#faq"
  get "/contact", to: "pages#contact"

  #   Carrinho / checkout
  resource  :cart,       only: :show
  resources :line_items, only: %i[create update destroy]

  namespace :checkout do
    resources :addresses, only: %i[new create]
    resources :payments,  only: %i[new create]
    resource  :order,     only: :show do
      get :success
      get :cancel
    end
  end

  #   Pós‑compra
  resources :orders,   only: %i[index show]
  resource  :profile,  only: :show
  resources :addresses, except: :show

  #   Webhooks
  namespace :webhooks do
    post :stripe,    to: "stripe#create"
    post :pagseguro, to: "pagseguro#create"
  end

  get "up", to: "rails/health#show", as: :rails_health_check

  # ---------- ADMIN (ActiveAdmin) ----------
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)          # → /admin

  # ---------- ADMIN PANEL PRÓPRIO ----------
  namespace :admin_panel, path: "painel", as: :panel do
    root "dashboard#index"          # painel_root_path
    resources :products
    resources :product_variants, only: %i[create update destroy]
    resources :orders,           only: %i[index show update]
    # resources :brands, etc.
  end
end