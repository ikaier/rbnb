Rails.application.routes.draw do
  get 'cars', to: 'cars#index'
  get 'cars/new', to:'cars#new'
  post 'cars', to:'cars#create'
  get 'cars/:id', to:'cars#show'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
