Rails.application.routes.draw do

  resources :users, only: [:show]

  namespace :admin do
    resources :users, only: [:new, :create, :show, :index, :edit, :destroy]
  end

  namespace :admin do
    resources :rewards
  end

  # namespace :admin do
  #   resources :points, only: [:new, :create]
  # end

  get '/admin/users/:id/points/new', to: "admin/points#new", as: :new_admin_point
  post '/admin/users/:id/points/', to: "admin/points#create", as: :admin_points

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
# get '/books' => 'books#index', as: :volumes
