Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#welcome'

  resources :users, :only => [:show, :edit, :update, :destroy]
  get '/signup' => 'users#new', :as => "signup"
  post '/signup' => 'users#create'
  # this renders a confirmation page before deleting a user
  get '/users/:id/delete' => 'users#delete', :as => "delete_user"

  get '/boards/most_messages' => 'boards#most_messages'
  
  resources :boards do
    resources :messages, :except => [:index, :new]
  end
  # this fixes a bug when a user tries to reload a page after a
  # failed comment attempt
  get '/boards/:id/messages' => 'boards#show'



  # this renders a confirmation page before deleting a board
  get '/boards/:id/delete' => 'boards#delete', :as => "delete_board"

  get '/login' => 'sessions#new', :as => "login"
  post '/login' => 'sessions#create'

  get '/auth/:provider/callback' => 'sessions#create'

  get '/logout' => 'sessions#destory', :as => 'logout'

end
