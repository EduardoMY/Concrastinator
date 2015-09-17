Rails.application.routes.draw do
 
  root 'welcome#index'
   
  resources :user
  get 'sessions/new'

  get 'activity' => 'user#show'
  get 'signUp' => 'user#new'
  
  get 'index' => 'welcome#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
end