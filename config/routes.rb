Rails.application.routes.draw do
  devise_for :users
  
  root 'farm#index', as: 'farm'
end
