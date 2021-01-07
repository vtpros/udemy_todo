Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about/', to: 'pages#about'
  get 'help/', to: 'pages#help'

  resources :todos, :photos
end
