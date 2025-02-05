# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :projects, except: %i[show destroy]

  get "up" => "rails/health#show", as: :rails_health_check
  root "projects#index"
end
