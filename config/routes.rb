Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :show] do
    member do
      post 'toggle_favorite', to: "cars#toggle_favorite"
    end
    resources :bookings
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

  get '/profile', to: 'pages#profile'
  get '/profile/reviews', to: 'pages#reviews'
  get '/profile/favorites', to: 'pages#favorites'
end
