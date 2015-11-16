Rails.application.routes.draw do
 
  root 'welcome#index'
   
  get 'sessions/new'

  get 'activity' => 'users#show'
  get 'signup' => 'users#new'
  
  get 'index' => 'welcome#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  get '/listing/results' => 'listing#results', :as => 'listing_button'

  resources :users
  resources :tasks,           only: [:create, :destroy]
  resources :tags,            only: [:create, :destroy]
  resources :priorities,      only: [:create, :destroy]
  
end