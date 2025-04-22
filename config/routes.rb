Rails.application.routes.draw do

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
