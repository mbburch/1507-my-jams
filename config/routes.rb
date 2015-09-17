Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :songs
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
