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

  # root 'sessions#login'
end
