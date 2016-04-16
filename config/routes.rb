Rails.application.routes.draw do

  resources :users, only: [:show]

  namespace :admin do
    resources :users, only: [:new, :create, :show, :index, :edit, :destroy]
  end

  namespace :admin do
    resources :rewards
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
