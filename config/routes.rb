Rails.application.routes.draw do
  resources :comments
  resources :tasks
  resources :employees
  resources :organizations
  resources :projects
  get '/welcome', to: 'static_pages#hello'
  
end
