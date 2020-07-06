Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'questions/index'
  root to: "questions#index"

  resources :questions
  resources :comments, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
