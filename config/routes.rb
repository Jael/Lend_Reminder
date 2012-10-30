LendReminder::Application.routes.draw do

  match "/auth/:provider/callback", :to => "sessions#create"
  get "signup" => "users#new", as: :signup
  resources :users 
  resources :lend_records do
      get :remind, on: :collection
      get :canceled, on: :member
  end
  root to: "lend_records#index"
  get "login" => "sessions#new", as: :log_in
  match "logout" => "sessions#destroy", as: :log_out 
  resources :sessions
  resources :password_resets
end
