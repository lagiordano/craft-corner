Rails.application.routes.draw do

  resources :projects, only: [:index, :show, :create, :update, :destroy]
  get '/:category/projects', to: 'projects#projects_by_category'

  resources :user_projects, only: [:index, :create, :destroy, :update]

  resources :users, only: [:destroy] 
  get '/me', to: 'users#show' 
  post '/signup', to: 'users#create'
  
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  
end
