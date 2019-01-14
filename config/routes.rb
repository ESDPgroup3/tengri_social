Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users, only: :show
  resources :posts
  # delete 'posts/:id', to: 'posts#destroy' 
  # resources :posts, only: [:create, :new , :show , :index, :update, :destroy, :posts_id]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
