LendReminder::Application.routes.draw do
  resources :lend_records do
    get :remind, on: :collection
  end
end
