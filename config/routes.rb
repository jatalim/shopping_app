Rails.application.routes.draw do
  devise_for :public_users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "products#index"

end
