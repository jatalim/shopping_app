Rails.application.routes.draw do

devise_for :public_users, path: 'public_users', controllers: { sessions: "public_users/sessions", registrations: "public_users/registrations" }
devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: "admins/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: "products#index"

get 'admins/dashboard' => 'admins#dashboard'

end
