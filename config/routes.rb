Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'calories#index'
  get 'chart', to: 'calories#chart'
  get 'result', to: 'weights#result'
  resources :calories
  resources :weights
  resources :password_resets
  devise_for :users

end
