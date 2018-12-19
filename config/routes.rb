Rails.application.routes.draw do

  resources :organizations do
    resources :employees, shallow: true
  end

  resources :projects, shallow: true do
    resources :tasks do
      resources :comments
    end
  end

  get '/', to: 'static_pages#hello'
  
end
