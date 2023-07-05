Rails.application.routes.draw do
  resources :categories, only: [:index, :show] 
  resources :projects, only: [:index, :show, :create, :update, :destroy]
  resources :user_projects, only: [:create, :destroy, :update]
  resources :users, only: [:destroy] do
    resources :projects, only: [:index, :show]
  end
  
  get '/me', to: 'users#show' 
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # root "articles#index"
  # pagenation: http://localhost:3000/projects/?page=2 for all projects, http://localhost:3000/categories/2/projects/?page=2 for projects witihn a category
end
