Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    patch :hide, on: :member
  end

  resources :users, except: %i[index]
  resources :session, only: %i[new create destroy]
  resources :hashtags, param: :name, only: %i[show]

  match '/403' => 'errors#not_authorized', via: :all, as: :not_authorized
  match '/404' => 'errors#not_found', via: :all, as: :not_found
  match '/422' => 'errors#unprocessable_entity', via: :all, as: :unprocessable_entity
  match '/500' => 'errors#internal_server_error', via: :all, as: :internal_server_error
end
