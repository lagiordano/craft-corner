Rails.application.routes.draw do
  resources :categories, only: [:index, :show] do
    resources :projects, only: [:index, :show]
  end

  resources :projects, only: [:index, :show, :create, :update]
  resources :user_projects, only: [:create]

  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'

  # root "articles#index"
end
