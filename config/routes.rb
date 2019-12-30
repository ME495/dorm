Rails.application.routes.draw do
  get 'welcome/index'

  get 'lectures/new'

	resources :rooms
	resources :students
  resources :lectures

  root 'login#login'
  get  '/main/:id', to: 'main#fetch'
  get  '/login',    to: 'login#login'
  post '/login',    to: 'login#create'
  get  '/logout',   to: 'login#destroy'
  get  '/passwd',   to: 'passwd#passwd'
  post '/passwd',   to: 'passwd#create'

  get  '/select_room', to: 'select_room#select'
  post '/select_room/get_room', to: 'select_room#get_room'
  post '/select_room/allocate_room', to: 'select_room#allocate_room'

  get '/welcome', to: 'welcome#index'
  get '/welcome/show_student', to: 'welcome#show_student'
end
