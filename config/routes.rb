Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:create]

  resources :comments, only: [:create]

  get "likes/toggle", as: "like_toggle"

  get "users/my_profile"

  patch "users/update" => "users#update", as: "user"
    
  root "posts#index"

end
