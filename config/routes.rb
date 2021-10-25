Rails.application.routes.draw do
  resources :catches
  resources :amos
  resources :users
  post "/login" => "users#login"
end
