Rails.application.routes.draw do
  resources :users
  
  get "/index" => "index#index"

  post "/login" => "users#login"
end
