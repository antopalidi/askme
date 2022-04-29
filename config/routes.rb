Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    patch :hide, on: :member
  end

  resources :users, only: %i[new create edit update, destroy]
  resources :session, only: %i[new create destroy]
  resources :settings
end
