Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#welcome'

  resources :users, :only => [:show, :edit, :update, :destory]
  get '/signup' => 'users#new', :as => "signup"
  post '/signup' => 'users#create'

  resources :boards do
    resources :messages, :except => [:index, :new]
  end

  get '/login' => 'sessions#new', :as => "login"
  post '/login' => 'sessions#create'

  get '/auth/:provider/callback' => 'sessions#create'

  get '/logout' => 'sessions#destory', :as => 'logout'

end
