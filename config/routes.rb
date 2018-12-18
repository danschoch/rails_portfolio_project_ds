Rails.application.routes.draw do
  resources :projects
  get '/welcome', to: 'welcome#hello'
  
end
