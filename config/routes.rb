Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:create]

  resources :comments, only: [:create]
    
  root "posts#index"

end
