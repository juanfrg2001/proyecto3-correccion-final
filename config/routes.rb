Rails.application.routes.draw do
  root 'calories#index'
  resources :calories
  devise_for :users

  get 'password_reset/index'
  get 'password_reset/reset'

  post '/users/password_reset', to: 'users#password_reset'
  get '/password_reset/:tmp_token', to: 'password_reset#index'
  post '/password_reset/reset', to: 'password_reset#reset'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
