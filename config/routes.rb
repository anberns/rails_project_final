Rails.application.routes.draw do
  resources :events
  resources :swimmers
  resources :coaches
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
