Rails.application.routes.draw do
  get 'index', to:'calories#index'
  root 'calories#index'
  resources :calories
  devise_for :users



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
