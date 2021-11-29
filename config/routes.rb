Rails.application.routes.draw do
  resources :events
  resources :failed_jobs
  resources :catches
  get "/catches/find/amos" => "catches#amos_catches"

  resources :amos
  get "/amos/find/user" => "amos#user_amos"
  get "/amos/find/animal_id" => "amos#animal_id"
  put "/amos/update/name" => "amos#update_name"
  put "/amos/update/location" => "amos#update_location"
  get "/amos/without/location" => "amos#amos_without_location"

  get "/amos/global/stats" => "amos#global_stats"

  resources :users
  get "users/find/current_users" => "users#current_user"
  get "users/catches/last_week" => "users#last_week_catches"
  put "users/update/name" => "users#update_name"
  put "users/update/email" => "users#update_email"
  put "users/update/password" => "users#update_password"

  post "/login" => "users#login"

  get "/leaderboard" => "leaderboard#leaderboard"
  get "/leaderboard/stats" => "leaderboard#global_stats"

  # for test =>
  post "/upload/image" => "upload_image#upload_image"
  delete "/delete/image" => "upload_image#delete_image"
end
