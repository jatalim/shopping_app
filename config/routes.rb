Rails.application.routes.draw do

devise_for :public_users, path: 'public_users', controllers: { sessions: "public_users/sessions", registrations: "public_users/registrations", :omniauth_callbacks => 'public_users/omniauth_callbacks' }
devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: "admins/registrations"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: "products#index"

get 'admins/dashboard' => 'admins#dashboard'
get 'public_users/show' => 'public_users#show'
post 'carted_products/qty' => 'carted_products#updateQuantity'

  resources :products
  resources :carted_products
  resources :product_taggings
  resources :ordered_products

  resources :orders, only: [:edit, :update]

post '/checkout' => 'ordered_products#create'

if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
