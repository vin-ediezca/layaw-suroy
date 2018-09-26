Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Tag
  root 'tags#index'
  resources :tags do
    member do
      delete :delete_image_attachment
    end
  end
  
  # Destination
  resources :destinations, only: [:new, :create, :edit, :update, :destroy]
  
  # User
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/account/:id', to: 'users#account', as: :user_account
  get 'manage', to: 'users#manage', as: :manage
  resources :users, only: [:edit, :update, :destroy]
  
  # Session
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
