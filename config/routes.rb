Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'static_pages#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post '/guest_login', to: 'user_sessions#guest_login'

  resources :users, only: %i[new create show]
  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
  end
  resources :likes, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  resources :notifications, only: %i[index] do
    patch :read, on: :member
  end
end
