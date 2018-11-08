Rails.application.routes.draw do
 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'home#index'

  resources :farms, shallow: true do
  	resources :areas
	resources :animals
  end

  
end