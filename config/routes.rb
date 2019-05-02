Rails.application.routes.draw do
  root 'gossips#index' #get 'pages/home'
  get 'team', to: 'pages#team'
  get 'welcome/:first_name', to: 'pages#hidden_link'

  resources :gossips do
    resources :comments
  end
  # resolve('Gossip') {[:create_gossip]}
  resources :users, only: [:show, :new, :create]
  resources :contacts, only: [:create, :new]  
  resources :cities, only: [:show, :index]
  resources :sessions
  resources :likes, only: [:new, :create, :destroy]
  # get 'contact', to: 'pages#contact'
  # get '/gossip/:id', to: 'pages#gossip_display', as: 'gossip'
  # get 'user/:id', to: 'pages#user_profil', as: 'user'

  # get 'form_filled', to: 'pages#form_filled'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
