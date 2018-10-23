Rails.application.routes.draw do
  resources :users
  resources :books
  get 'login/index'
  post 'login/auth'
  get 'login/logout'
end
