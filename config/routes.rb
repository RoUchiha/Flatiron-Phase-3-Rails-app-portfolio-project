Rails.application.routes.draw do
  
  resources :shows do
    resources :comments, only: [:index, :show, :new, :edit]
    resources :ratings, only: [:index, :show, :new, :edit]
  end
  resources :ratings 
  resources :comments 
 
  resources :users do
    resources :shows, only: [:index, :show, :new, :edit]
  end

  get '/auth/github/callback', to: 'users#github_login'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post 'ratings/new', to: 'ratings#create'
  get 'ratings/new', to: 'shows#show'
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
