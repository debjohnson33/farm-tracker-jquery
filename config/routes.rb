Rails.application.routes.draw do
 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'home#index'

  resources :farms
  resources :areas
  resources :animals
  resources :baby_animals
  
end