Rails.application.routes.draw do
  resources :steps
  resources :comments
  resources :posts
  resources :users
  resources :bakes
  resources :bakers_percentages
  resources :recipes
  resources :ingredients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
