Rails.application.routes.draw do
  resources :catches
  resources :amos
  get "/amos/find/user" => "amos#user_amos"

  resources :users

  post "/login" => "users#login"
end
