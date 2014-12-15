Setbuilder::Application.routes.draw do
  



  resources :posts


  resources :setlists
  match 'publish_new' => 'setlists#publish_new'
  match 'publish' => 'setlists#publish'
  
  resources :setlist_items do
    post :update_song_order, on: :collection
  end
  resources :songs
  match "/song_search" => "songs#song_search"

  resources :notifications


  resources :roles
  resources :users 
  resources :user_sessions   
  match 'login' => "user_sessions#new", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
   



######## Notification Routes   
  
   match '/notification/handler' => "notifications#handler"
   
   match 'profile' => 'users#profile'

   match 'signup' => 'users#new', :as => :signup
   
   match 'admin' => 'admin#index'
   
   match 'taskpopup' => 'tasks#taskpopup'
   match 'new_taskpopup' => 'tasks#new_taskpopup'
   
   match '/changeset' => 'setlists#change_active'
   
   root :to => 'home#index'


end
