Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tops#index"
  resources :categories, only: :show do
    resources :templates, only: :index
  end
  
  resources :users, only: [:new, :create, :edit, :update]
  resources :templates, only: [:index, :show, :create, :new, :destroy] do
    resources :bookmarks, only: [:create, :destroy, :index]
    resources :likes, only: [:create, :destroy] # 追加
  end
  resources :bookmarks, only: [:index]

  get '/profile/:id', to: 'users#profile', as: :user_profile
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
end
