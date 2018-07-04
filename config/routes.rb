Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Tag
  root 'tags#index'
  resources :tags, only: [:index, :show, :new, :create, :edit, :update]
  
  # Destination
  resources :destinations, only: [:new, :create, :edit, :update]
  
  # User
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get '/account/:id' => 'users#account', as: :user_account
  resources :users, only: [:edit, :update]
  
  # Session
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
end
