BreakableToy::Application.routes.draw do
  devise_for :users

  resources :users
  resources :teams
  resources :activities
  resources :user_activities

  root 'teams#index'
end
