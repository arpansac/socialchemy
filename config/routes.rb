Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  post 'users/api_sign_in' => "users#api_sign_in"

  resources :posts, only: [:create, :index]

  resources :comments, only: [:create]

  get "likes/toggle", as: "like_toggle"

  get "users/my_profile"

  patch "users/update" => "users#update", as: "user"
    
  root "posts#index"

  namespace :api do
  	namespace :v1 do
  		get 'posts' => 'posts#index'
    end
  end





end















