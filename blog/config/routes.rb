Rails.application.routes.draw do
 
  root 'welcome#index'
   
  get 'sessions/new'

  get 'activity' => 'users#show'
  get 'signup' => 'users#new'
  
  get 'edit' => 'users#edit'
  
  get 'index' => 'welcome#index'
  get    'login'   => 'sessions#new'
  get   '/tasks/:id' => 'users#show'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  post '/tasks/:id/suggestions' => 'tasks#suggestions' , :as => :suggestions_task
  
  resources :users
  resources :tasks,           only: [:create,:edit, :destroy, :update]
  resources :tags,            only: [:create, :destroy]
  resources :priorities,      only: [:create, :destroy]
end