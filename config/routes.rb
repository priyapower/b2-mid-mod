Rails.application.routes.draw do
  resources :surgeries, only: :index
end
