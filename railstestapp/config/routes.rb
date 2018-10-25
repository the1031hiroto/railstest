Rails.application.routes.draw do
  get 'rooms/showchat'
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :likes
  resources :users
  resources :books
  get 'login/index'
  post 'login/auth'
  get 'login/logout'
  get 'like/check'
end
