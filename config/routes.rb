Rails.application.routes.draw do
  resources :categories, only: [:index] do 
    resources :projects, only: [:index, :show]
  end

  resources :projects, only: [:index, :show, :create, :update, :destroy]

  resources :user_projects, only: [:index, :create, :destroy, :update]

  resources :users, only: [:destroy] 
  get '/me', to: 'users#show' 
  post '/signup', to: 'users#create'
  
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  
end
