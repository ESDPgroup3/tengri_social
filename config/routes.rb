Rails.application.routes.draw do
  devise_for :users
  root  'authentication#login_or_signup'
  get 'authentication/show_form', as: :show_form_in
  post 'authentication/look_for'
  resources :comments, only: [:new, :create]
  resources :users, :only => [:index, :show] do
    member do
      get 'follows'
      get 'followers'
    end
  end
  resources :posts
  get 'follow_toggle/:user_id', to: 'users#follow_toggle', as: :follow_toggle
end
