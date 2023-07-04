Rails.application.routes.draw do
  resources :categories, only: [:index, :show] do
    resources :projects, only: [:index, :show]
  end

  resources :users, only: [:show] do
    resources :projects, only: [:index, :show]
  end
  
  resources :projects, only: [:index, :show, :create, :update]
  resources :user_projects, only: [:create, :index]

  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'
  # get '/me', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'

  # root "articles#index"
  # pagenation: http://localhost:3000/projects/?page=2 for all projects, http://localhost:3000/categories/2/projects/?page=2 for projects witihn a category
end
