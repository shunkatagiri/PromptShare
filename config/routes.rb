Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tops#index"
  resources :categories, only: :show do
    resources :templates, only: :index
  end
  
  resources :users, only: [:new, :create]
  resources :templates, only: [:index, :show, :create, :new, :destroy] do
    resources :bookmarks, only: [:create, :destroy]
  end
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
end
