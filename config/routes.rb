Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  devise_for :users
  get 'items/index'
  resources :users, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

root to: "items#index"
  # root "articles#index"
end
