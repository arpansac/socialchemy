Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :posts, only: [:create]

  resources :comments, only: [:create]

  get "likes/toggle", as: "like_toggle"

  get "users/my_profile"

  patch "users/update" => "users#update", as: "user"
    
  root "posts#index"

end
