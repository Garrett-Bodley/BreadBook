Rails.application.routes.draw do
  # post '/recipes/new', to: 'recipes#new'
  # post '/recipes/cart/add', to: 'recipes#add'
  # get '/recipes/cart', to: 'recipes#cart'
  # delete '/recipes/cart/:id', to: 'recipes#remove'

  get '/cart', to: 'cart#show'
  post '/cart', to: 'cart#add', as: 'add_to_cart'
  resources :cart, only: [:create, :update, :destroy]
  
  resources :steps, :users, :bakes, :bakers_percentages, :recipes
  resources :comments, :posts, :ingredients do
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :recipes

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
