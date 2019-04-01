# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/liked_posts', to: 'users#liked_posts'
  devise_for :users, controllers: { registrations: 'registrations' },
                     controllers: { sessions: 'sessions' }
  resources :users, except: %i[destroy create] do
    member do
      get 'follows'
      get 'followers'
    end
  end
  root 'authentication#show_form'
  get 'authentication/show_form', as: :show_form_in
  post 'authentication/look_for'
  get 'authentication/add_nickname', as: :nickname
  post 'authentication/nickname_exists'
  get 'authentication/code_confirmation'
  post 'authentication/confirmation'
  get 'authentication/open_sess', to: 'authentication#open_sess', as: "open_sess"
  get '/posts/hashtag/:name', to: 'posts#hashtags', as: :hashtag

  resources :posts do
    resources :comments, module: :posts
  end
  get 'likes_toggle/:post_id', to: 'users#likes_toggle', as: :likes_toggle
  get 'follow_toggle/:user_id', to: 'users#follow_toggle', as: :follow_toggle
  get 'is_private/:user_id', to: 'users#is_private', as: :is_private
  get 'ask_follow_toggle/:user_id', to: 'users#ask_follow_toggle', as: :ask_follow_toggle
  get 'searches', to: 'searches#index', as: 'searches'
  get 'phones', to: 'searches#phone_search', as: 'phone_search'
  get 'hashtags', to: 'searches#hashtag_search', as: 'hashtag_search'
  delete 'delete_avatar/:upload_id', to: 'users#delete_avatar', as: :delete_avatar
end
