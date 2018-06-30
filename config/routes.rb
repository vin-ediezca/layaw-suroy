Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Tags
  root 'tags#index'
  resources :tags, only: [:index, :show, :new, :create, :edit, :update]
  
  # Destinations
  resources :destinations, only: [:new, :create, :edit, :update]
end
