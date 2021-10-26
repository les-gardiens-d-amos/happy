Rails.application.routes.draw do
  resources :catches
  get "/catches/find/amos" => "catches#amos_catches"

  resources :amos
  get "/amos/find/user" => "amos#user_amos"

  resources :users

  post "/login" => "users#login"
end
