Rails.application.routes.draw do
  resources :likes
  resources :users
  resources :books
  get 'login/index'
  post 'login/auth'
  get 'login/logout'
  get 'like/check'
end
