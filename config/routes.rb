Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    patch :hide, on: :member
  end

  resources :users, except: %i[index]
  resources :session, only: %i[new create destroy]
  resources :hashtags, only: %i[show]
end
