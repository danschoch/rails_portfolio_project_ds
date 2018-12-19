Rails.application.routes.draw do

  resources :organizations do
    resources :employees, shallow: true
  end

  resources :projects, shallow: true do
    resources :tasks do
      resources :comments
    end
  end

  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'static_pages#signup'
  
end
