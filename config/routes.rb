Rails.application.routes.draw do

  resources :users, only: [:show]

  namespace :admin do
    resources :users
  end

  namespace :admin do
    resources :rewards
    # resources :users do
      # resources :points, only: [:new]
    # end
  end

  get '/admin/users/:id/points/new', to: "admin/points#new", as: :new_admin_point
  post '/admin/users/:id/points/', to: "admin/points#create", as: :admin_points
  get '/users/:id/rewards/new', to: "rewards#new", as: :new_user_reward
  get '/users/:id/rewards', to: "rewards#index", as: :user_rewards
  post '/users/:user_id/rewards/:id', to: "rewards#create", as: :user_reward


  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
