Rails.application.routes.draw do
 
  root 'welcome#index'
   
  get 'sessions/new'

  get 'activity' => 'users#show'
  get 'signup' => 'users#new'
  
  get 'index' => 'welcome#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users
  resources :tasks,           only: [:create,:edit, :destroy]
  resources :tags,            only: [:create, :destroy]
  resources :priorities,      only: [:create, :destroy]
  
end