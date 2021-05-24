Rails.application.routes.draw do

  get 'notifications/index'
  get 'messages/index'
  get "/"=>"follows#index"

  resources:posts do
    resources:comments do
      resources:likecomments, only: [:create, :destroy]
    end
    resources:likes

    collection do
      get :search_form
    end

    member do
      get :comment
      post :come
      post :destroy_at_comment
      get :like_user_index
    end
  end






  resources :users do
    member do
      get :likes
      get :followings
      get :followers
      get :followers_you_follow
    end

    resources:follows, only:[:index, :create, :destroy]


    collection do
      get :login_form
      post :login
      post :logout
      get :guest_form
      post :guest
    end

  end

  resources:likes, only: [:create, :destroy]

  resources:hashtags, only: [:show]

  resources:follows, only:[:index, :create, :destroy]

  resources:talks

  resources:messages, only: [:index]

  resources:notifications

  resources:home do
    collection do
      get :about
      get :top
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
