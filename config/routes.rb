Rails.application.routes.draw do
  
  resources :users do
    resources :tests
    resources :courses
    get 'enrolled', to: 'users#enrolled'
  end
  
  resources :courses do
    get 'enroll', to: 'courses#enroll'
    get 'unenroll', to: 'courses#unenroll'
    resources :tests
  end
  get 'all_courses', to: 'courses#all_courses'
  
  resources :tests do
    resources :questions
  end

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  root 'sessions#login'
  get '*path' => redirect('/')
end
