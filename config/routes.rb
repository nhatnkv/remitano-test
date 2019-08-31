Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  post 'login_or_register', to: "home#login_or_register"
  get 'share', to: 'movie#new', as: :share_movie
  post 'shared_movie', to: 'movie#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
