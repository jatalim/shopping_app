Rails.application.routes.draw do
  devise_for :public_users, :controllers => { :omniauth_callbacks => "public_users/omniauth_callbacks" }
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "products#index"

  resources :products
  resources :carted_products
  resources :product_taggings

end
