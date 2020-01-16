Rails.application.routes.draw do
	resources :rooms
	resources :students
  resources :lectures
  # resources :robdorm
  root 'login#login'
  get  '/main/:id', to: 'main#fetch'
  get  '/login',    to: 'login#login'
  #get '/robdorm', to:'robdorm#index'
  post '/login',    to: 'login#create'
  get  '/logout',   to: 'login#destroy'
  get  '/robdorm/:id', to: 'robdorm#index'
  post '/robdorm/:id', to: 'robdorm#create'
end
