# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'questions/index'
  root to: 'questions#index'

  resources :questions do
    member do
      post :favourite
    end
    collection do
    end
  end
  resources :comments, only: %i[create destroy]

  resource :profile, controller: :profile, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
