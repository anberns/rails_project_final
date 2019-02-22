Rails.application.routes.draw do
  root 'welcome#home'
  resources :events
  resources :swimmers
  resources :swimmer_events
  resources :teams do
    resources :swimmers, only: [:index, :new, :create]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  post '/events/filter' => 'events#filter'
  #patch '/swimmer_events/:id' => 'swimmer_events#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
