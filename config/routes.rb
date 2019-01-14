Rails.application.routes.draw do
  devise_for :users
  root  'authentication#show_form'
  post 'authentication/look_for'
  resources :users, only: :show
  resources :posts, only: [:create, :new , :show , :index]
end
