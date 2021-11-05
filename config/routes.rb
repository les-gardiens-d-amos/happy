Rails.application.routes.draw do
  resources :failed_jobs
  resources :catches
  get "/catches/find/amos" => "catches#amos_catches"

  resources :amos
  get "/amos/find/user" => "amos#user_amos"
  get "/amos/find/animal_id" => "amos#animal_id"
  put "/amos/update/name" => "amos#update_name"

  resources :users

  post "/login" => "users#login"

  get "/check/service" => "check_service#check_service"
end
