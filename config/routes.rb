Rails.application.routes.draw do
  resources :surgeries, only: [:index, :show]
  patch "/surgeries/:id", to: "surgeries#update_doctor"
  resources :hospitals, only: :index
end
