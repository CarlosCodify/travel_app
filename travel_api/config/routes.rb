# frozen_string_literal: true

Rails.application.routes.draw do
  resources :staffs
  resources :sales
  resources :buses
  resources :travels
  resources :manufacturers do
    resources :vehicle_models, only: %i[index create]
  end
  resources :vehicle_models, only: %i[show update destroy] do
    resources :year_manufacturers, only: %i[index create]
  end
  resources :year_manufacturers, only: %i[show update destroy]
  resources :routes do
    post :add_cities, on: :member
  end
  resources :cities
end
