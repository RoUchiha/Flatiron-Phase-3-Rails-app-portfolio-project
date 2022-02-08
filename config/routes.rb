Rails.application.routes.draw do
  resources :comments 
  resources :ratings
  resources :shows do
    resources :comments 
    resources :ratings 
  end
  resources :users do
    resources :shows
  end

  get '/auth/google/callback', to: 'users#google_login'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
