# frozen_string_literal: true

Rails.application.routes.draw do
  resources :customers
  resources :users
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :staffs do
    get :staffs_by_user_id, on: :collection
  end
  resources :sales
  resources :buses
  resources :travels
  resources :manufacturers do
    resources :vehicle_models, only: %i[index create]
  end
  resources :vehicle_models, only: %i[show update destroy] do
    resources :year_manufacturers, only: %i[create]
  end
  resources :year_manufacturers, only: %i[index show update destroy]
  resources :routes do
    post :add_cities, on: :member
  end
  resources :cities
end
