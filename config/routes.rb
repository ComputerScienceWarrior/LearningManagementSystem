Rails.application.routes.draw do
  
  resources :users do
    resources :tests
    resources :courses
  end
  
  resources :courses do
    resources :tests
  end
  
  resources :tests

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  root 'sessions#login'
end
