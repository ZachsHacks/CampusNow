Rails.application.routes.draw do
  resources :event_tags
  resources :tags
  resources :interests
  resources :rsvps
  resources :users
  resources :events
  get '/', to: "welcome#index"
	get '/events/new', to: "event#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "welcome#index"
end
