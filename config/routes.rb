Rails.application.routes.draw do

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  concern :commentable do
    resources :comments, shallow: true
  end

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/cart', to: 'recipes#new'
  post '/cart', to: 'recipes#add', as: 'add_to_cart'
  get '/cart/:id', to: 'recipes#remove', as: 'remove_from_cart'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/recipes/saved', to: 'bookmarks#saved_recipes', as: 'saved_recipes', concerns: :paginatable
  get '/ingredients/saved', to: 'bookmarks#saved_ingredients', as: 'saved_ingredients', concerns: :paginatable
  get '/posts/saved', to: 'bookmarks#saved_posts', as: 'saved_posts', concerns: :paginatable

  resources :users
  resources :bookmarks, only: [:create, :destroy]

  resources :bakes, concerns: :paginatable do
    resources :steps
  end

  resources :likes, only: [:create, :destroy]
  resources :ingredients, concerns: [:commentable, :paginatable]
  resources :posts, concerns: [:paginatable, :commentable]

  resources :recipes, concerns: [:commentable, :paginatable] do
    resources :bakers_percentages, shallow: true, only: [:new, :create], path: 'update'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
