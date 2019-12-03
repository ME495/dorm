Rails.application.routes.draw do 
  root 'login#login'
  get  '/main/:id', to: 'main#fetch'
  get  '/login',    to: 'login#login'
  post '/login',    to: 'login#create'
  get  '/logout',   to: 'login#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
