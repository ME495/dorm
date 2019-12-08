Rails.application.routes.draw do
  get 'lectures/new'

	resources :rooms
	resources :students
  resources :lectures
  root 'login#login'
  get  '/main/:id', to: 'main#fetch'
  get  '/login',    to: 'login#login'
  post '/login',    to: 'login#create'
  get  '/logout',   to: 'login#destroy'
end
