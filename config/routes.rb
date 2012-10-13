LendReminder::Application.routes.draw do
  resources :lend_records do
      get :remind, on: :collection
      get :canceled, on: :member
  end
end
