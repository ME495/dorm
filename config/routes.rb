Rails.application.routes.draw do

	resources:rooms
	resources:students
  root 'login#login'
  get  '/main/:id', to: 'main#fetch'
  get  '/login',    to: 'login#login'
  post '/login',    to: 'login#create'
  get  '/logout',   to: 'login#destroy'
  get  '/passwd',   to: 'passwd#passwd'
  post '/passwd',   to: 'passwd#create'
  post '/rooms/:id',    to: 'rooms#update'
  post '/students/:id', to: 'students#update'
end
