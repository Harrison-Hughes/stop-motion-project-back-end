Rails.application.routes.draw do
  resources :frames
  resources :films
  resources :users
  post '/login', to: 'auth#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end