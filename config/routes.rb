Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  resources :questions do
    resources :answers
  end
end
