Rails.application.routes.draw do
  
  resources :users
  resources :courses
  resources :tests

  resources :users do
    resources :courses
  end
  
  resources :users do
    resources :tests
  end

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  root 'sessions#login'
end
