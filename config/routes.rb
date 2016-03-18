Rails.application.routes.draw do
  
  # Root path
  root "welcome#index"
  
  # Add web pages bellow
  get 'admin-panel', to: "admin_panel#index"
  get 'list-users', to: "admin_panel#list_users"
  get 'add-article', to: "admin_panel#add_article"
  get 'about', to: 'pages#about'
  get 'contact', to: "pages#contact"
  # Add resources bellow
  resources :users
  resources :articles
  resources :categories
  resources :ads
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # get 'login', to: "users#sign_in"
  # get 'signup', to: "users#sign_up"
  # get 'adminlogin', to: "admins#sign_in"
  
end
