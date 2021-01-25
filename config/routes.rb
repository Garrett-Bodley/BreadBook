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
  get '/logout', to: 'sessions#destroy'

  get '/recipes/saved', to: 'bookmarks#saved_recipes', as: 'saved_recipes', concerns: :paginatable
  get '/ingredients/saved', to: 'bookmarks#saved_ingredients', as: 'saved_ingredients', concerns: :paginatable
  get '/posts/saved', to: 'bookmarks#saved_posts', as: 'saved_posts', concerns: :paginatable

  get '/recipes/most_used', to: 'recipes#most_used', as: 'most_used_recipes', concerns: :paginatable
  get '/ingredients/most_used', to: 'ingredients#most_used', as: 'most_used_ingredients', concerns: :paginatable
  get '/posts/most_discussed', to: 'posts#most_discussed', as: 'most_discussed_posts', concerns: :paginatable

  resources :users do
    resources :posts, shallow: true, only: [:index], concerns: :paginatable, to: 'posts#user_posts'
    resources :ingredients, shallow: true, only: [:index], concerns: :paginatable, to: 'ingredients#user_ingredients'
    resources :recipes, shallow: true, only: [:index], concerns: :paginatable, to: 'recipes#user_recipes'
  end
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
