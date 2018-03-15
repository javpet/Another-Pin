Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # We want to see multiple products
  resources :products do
    resources :order_items
  end

  # We want our users to order multiple times
  resources :orders

  # We only want the user to see ONLY one cart!
  resource :cart

  get "info", to: "pages#info"

  root "pages#home"
end
