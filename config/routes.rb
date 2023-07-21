Rails.application.routes.draw do

  resources :projects, only: [:index, :show, :create, :update]
  get '/:category/projects', to: 'projects#projects_by_category'
  get '/shared_by_user', to: 'projects#shared_by_user'

  resources :user_projects, only: [:create, :destroy, :update]
  get 'collection/:filter', to: 'user_projects#filtered_collection'
  get 'in_collection/:project_id', to: 'user_projects#in_collection?'


  resources :users, only: [:destroy] 
  get '/me', to: 'users#show' 
  post '/signup', to: 'users#create'
  
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  
end
