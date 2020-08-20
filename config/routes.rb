Rails.application.routes.draw do
  get 'cars/search', to: 'cars#index', :as => 'search_page'
  get 'cars/new', to:'cars#new'
  post 'cars', to:'cars#create'
  get 'cars/:id', to:'cars#show', as: :car
  get 'cars/:id/book', to:'cars#book', as: :book
  #get 'cars/:id/contracts/new', to:'contracts#new'
  get 'contracts/success', to:'contracts#success', as: :success
  post 'cars/:id/book', to:'contracts#create'
  resources :pages do
    collection do
      get :home
    end
  end

  resources :cars do
    collection do
      get :new
    end
  end

  devise_for :users
  root to: 'pages#home', as: :root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
