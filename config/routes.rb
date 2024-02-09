Rails.application.routes.draw do
  root to:'schedules#index'
  resources :schedules, only: [:index, :new, :create, :edit, :update] do
    collection do
      get :search
    end
  end
end
