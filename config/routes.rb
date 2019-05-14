Rails.application.routes.draw do

  get 'recipes', to: 'recipes#index', as: :recipes

  get 'recipes/new', to: 'recipes#new', as: :new_recipe

  get 'recipes/:id', to: 'recipes#show', as: :recipe

  get 'recipes/:id/edit', to: 'recipes#edit', as: :edit_recipe

  post 'recipes', to: 'recipes#create'

  patch 'recipes/:id', to: 'recipes#update'

  delete 'recipes/:id', to: 'recipes#destroy'

  root "pages#home"
  get 'pages/home', to: 'pages#home'

  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
