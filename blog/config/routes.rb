Rails.application.routes.draw do
 
  root 'welcome#index'
   
  resources :users
  get 'sessions/new'

  get 'activity' => 'users#show'
  get 'signup' => 'users#new'
  
  get 'index' => 'welcome#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
end