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
  # resources :destinations, only: [:new, :create, :edit, :update, :destroy]
  resources :destinations do
    member do
      delete :delete_image_attachment
    end
  end

  # Category
  resources :categories
  
  # User
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/account/:id', to: 'users#account', as: :user_account
  get 'manage_users', to: 'users#manage', as: :manage
  resources :users, only: [:edit, :update, :destroy]
  
  # Session
  get 'admin', to: 'sessions#new'
  post 'admin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
