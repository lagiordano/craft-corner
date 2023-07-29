Rails.application.routes.draw do

  resources :projects, only: [:index, :show, :create, :update]
  # get '/:category/projects', to: 'projects#projects_by_category'
  get '/popular_sample', to: 'projects#popular_sample'

  resources :user_projects, only: [:create, :destroy, :update]
  get 'collection/:filter', to: 'user_projects#filtered_collection'
  get 'check_in_collection/:project_id', to: 'user_projects#check_in_collection'


  resources :users, only: [:destroy, :update] 
  get '/me', to: 'users#show' 
  post '/signup', to: 'users#create'
  
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  
end
