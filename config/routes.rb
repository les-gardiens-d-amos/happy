Rails.application.routes.draw do
  resources :amos
  resources :users
  post "/login" => "users#login"
end
