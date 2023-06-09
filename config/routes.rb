Rails.application.routes.draw do
  root "tops#index"
  
  resources :categories, only: :show do
    resources :templates, only: :index
  end
  
  resources :users, only: [:new, :create, :edit, :update]
  resources :templates, only: [:index, :show, :create, :new, :edit, :update, :destroy] do
    resources :bookmarks, only: [:create, :destroy, :index]
    resources :likes, only: [:create, :destroy]
  end
  resources :bookmarks, only: [:index]

  get '/profile/:id', to: 'users#profile', as: :user_profile
  get 'login', to: 'user_sessions#new', as: :login
  get 'modal/show', to: 'modal#show', as: :modal_show
  get '/about', to: 'about#show', as: 'about'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
  

  get 'search', to: 'templates#search', as: :search_templates
end
