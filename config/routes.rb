Rails.application.routes.draw do
  resources :categories, only: [:index, :show]
  resources :projects, only: [:index]
  # root "articles#index"
end
