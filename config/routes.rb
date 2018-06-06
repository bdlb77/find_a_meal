Rails.application.routes.draw do
  devise_for :users
  root to: 'events#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  	resources :bookings, only: [:index]
  end
  resources :events, only: [:index, :show, :new, :create, :edit, :destroy] do
  	resources :bookings, only: [:new, :create, :show, :edit]
  end
  resources :bookings, only:[:destroy]
end
