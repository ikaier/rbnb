Rails.application.routes.draw do
  get 'cars/search', to: 'cars#index', :as => 'search_page'
  get 'cars/new', to:'cars#new'
  post 'cars', to:'cars#create'
  get 'cars/:id', to:'cars#show', as: :car


  devise_for :users
  root to: 'pages#home', as: :root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
