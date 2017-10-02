Rails.application.routes.draw do
  devise_for :public_users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "products#index"

end
