# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :projects, except: :destroy do
    resources :comments, only: %i[create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  root "projects#index"
end
