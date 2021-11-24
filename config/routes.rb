Rails.application.routes.draw do
  root 'calories#index'
  get 'chart', to: 'calories#chart'
  resources :calories
  resources :weights
  resources :token_share
  devise_for :users

end
