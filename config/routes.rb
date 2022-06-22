Rails.application.routes.draw do
  
  resources :users do
    resources :tests
    resources :courses
  end
  
  resources :courses do
    resources :tests
  end
  get 'all_courses', to: 'courses#all_courses'
  get 'enroll', to: 'courses#enroll'
  
  resources :tests do
    resources :questions
  end

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  root 'sessions#login'
  get '*path' => redirect('/')
end
