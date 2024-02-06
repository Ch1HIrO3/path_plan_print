Rails.application.routes.draw do
  root to:'schedules#index'
  resources :schedules, only: [:index, :new, :create]
  # resources :plans, only: [:edit]
end
