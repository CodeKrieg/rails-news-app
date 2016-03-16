Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  # Root path
  root "welcome#index"
  
  # Add resources bellow
  resources :articles
  resources :categories
  resources :ads
  
  # get 'login', to: "users#sign_in"
  # get 'signup', to: "users#sign_up"
  # get 'adminlogin', to: "admins#sign_in"
  
end
