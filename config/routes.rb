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

  get 'sign-up', to: 'sessions#sign_up'
  get 'login', to: 'sessions#login'
  get 'logout', to: 'sessions#logout'

  root 'sessions#login'
end
