Rails.application.routes.draw do
  devise_for :users
   root to: "users#show"
  resources :users, only: :show
  resources :posts, only: [:create, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
