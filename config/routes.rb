BreakableToy::Application.routes.draw do
  devise_for :users

  resources :users
  resources :teams

  root 'users#index'
end
