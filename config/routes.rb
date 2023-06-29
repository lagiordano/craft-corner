Rails.application.routes.draw do
  resources :categories, only: [:index, :show]
  resources :projects, only: [:index, :show, :create]
  # root "articles#index"
end
