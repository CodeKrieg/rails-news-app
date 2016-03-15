Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  # Root path
  root "welcome#index"
  
  # Add resources bellow
  resources :articles
  
end
