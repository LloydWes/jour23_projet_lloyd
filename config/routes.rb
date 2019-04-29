Rails.application.routes.draw do
  root 'pages#home' #get 'pages/home'
  get 'team', to: 'pages#team'
  get 'contact', to: 'pages#contact'
  get 'welcome/:first_name', to: 'pages#hidden_link'
  get '/gossip/:id', to: 'pages#gossip_display', as: 'gossip'
  get 'user/:id', to: 'pages#user_profil', as: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
