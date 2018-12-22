Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/signup', to: 'static_pages#signup'
  post '/signup', to: 'organizations#create'
  get '/login', to: 'static_pages#login'
  post '/login', to: 'sessions#create'
  post '/sessions/create', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :organizations do
    resources :employees, shallow: true
  end

  resources :projects, shallow: true do
    resources :tasks do
      resources :comments
    end
  end

end
