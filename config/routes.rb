Rails.application.routes.draw do
  resources :surgeries, only: [:index, :show]
  patch "/surgeries/:id", to: "surgeries#update_doctor"
  resources :hospitals, only: [:index, :show] do
    get "/surgeries", to: "hospitals/surgeries#surgery_index"
  end
end
