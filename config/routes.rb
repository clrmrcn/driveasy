Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :show] do
    resources :bookings
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

  get '/profile', to: 'pages#profile'
  get '/profile/reviews', to: 'pages#reviews'
end
