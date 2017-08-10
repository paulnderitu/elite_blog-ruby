Rails.application.routes.draw do
  resources :users
  resources :sessions

  root to: 'questions#index'
  resources :users
  resources :questions do
    resources :answers
  end
end
