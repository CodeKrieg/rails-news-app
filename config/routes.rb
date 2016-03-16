Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  # Root path
  root "welcome#index"
  
  # Add web pages bellow
  get 'admin-panel', to: "admin_panel#index"
  get 'list-users', to: "admin_panel#list_users"
  get 'add-article', to: "admin_panel#add_article"
  
  # Add resources bellow
  resources :articles
  resources :categories
  resources :ads
  
  # get 'login', to: "users#sign_in"
  # get 'signup', to: "users#sign_up"
  # get 'adminlogin', to: "admins#sign_in"
  
end
