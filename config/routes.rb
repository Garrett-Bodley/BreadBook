Rails.application.routes.draw do

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  concern :commentable do
    resources :comments, shallow: true
  end

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/cart', to: 'cart#show'
  post '/cart', to: 'cart#add', as: 'add_to_cart'
  delete '/cart/:id', to: 'cart#remove', as: 'remove_from_cart'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'



  get '/recipes/saved', to: 'bookmarks#saved_recipes', as: 'saved_recipes'
  get '/ingredients/saved', to: 'bookmarks#saved_ingredients', as: 'saved_ingredients'
  get '/posts/saved', to: 'bookmarks#saved_posts', as: 'saved_posts'

  resources :users
  resources :bookmarks, only: [:create, :destroy]

  resources :bakes do
    resources :steps
  end

  resources :likes, only: [:create, :destroy]
  resources :ingredients, concerns: :commentable
  resources :posts, concerns: [:paginatable, :commentable]

  resources :recipes do
    resources :comments, shallow: true
    resources :bakers_percentages, shallow: true, only: [:new, :create], path: 'update'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
