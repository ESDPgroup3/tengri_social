Rails.application.routes.draw do
  devise_for :users
  root  'authentication#show_form'
  post 'authentication/look_for'
  resources :users, :only => [:index, :show] do
    member do
      get 'follows'
      get 'followers'
    end
  end
  resources :posts
  get 'likes_toggle/:post_id', to: 'users#likes_toggle', as: :likes_toggle
  get 'follow_toggle/:user_id', to: 'users#follow_toggle', as: :follow_toggle
end
