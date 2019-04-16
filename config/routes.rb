Rails.application.routes.draw do
  get 'recipes', to: 'recipes#index', as: :recipes

  get 'recipes/new', to: 'recipes#new', as: :new_recipe

  get 'recipes/:id', to: 'recipes#show', as: :recipe

  get 'recipes/:id/edit', to: 'recipes#edit', as: :edit_recipe

  post 'recipes', to: 'recipes#create'

  patch 'recipes/id', to: 'recipes#update'


  root "pages#home"
  get 'pages/home', to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
