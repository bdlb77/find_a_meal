Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users 
  resources :events, only: [:index, :show, :new, :create, :edit, :delete] do
  	resources :bookings, only: [:new, :create, :show, :index, :edit, :delete]
  end
end
