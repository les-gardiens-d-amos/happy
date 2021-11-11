Rails.application.routes.draw do
  resources :events
  resources :failed_jobs
  resources :catches
  get "/catches/find/amos" => "catches#amos_catches"

  resources :amos
  get "/amos/find/user" => "amos#user_amos"
  get "/amos/find/animal_id" => "amos#animal_id"
  put "/amos/update/name" => "amos#update_name"

  resources :users
  get "users/find/current_users" => "users#current_user"
  get "users/catches/last_week" => "users#last_week_catches"
  put "users/update/name" => "users#update_name"
  put "users/update/email" => "users#update_email"
  # put "users/update/password"

  post "/login" => "users#login"
end
