Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  namespace :admin do
    resources :users, only: [:index, :show] do
      patch :withdraw, on: :member
    end
    resources :posts, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :destroy]
    resources :groups, only: [:index, :destroy, :show] do
      delete 'remove_member/:member_id', to: 'group#remove_member', as: 'remove_member'
    end
  end

  scope module: :public do
    get "search", to: "searches#index", as: "search"
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:edit, :update, :show, :index] do
      member do
        get :mypage
        patch :withdraw
      end
    end
    resources :groups do
      member do
        post 'join_request'
        patch 'approve/:member_id', to: "groups#approve", as: "approve_member"
        patch 'reject/:member_id', to: "groups#reject", as: "reject_member"
      end
      resources :messages, only: [:create]
    end
  end

  root :to =>"homes#top"
  get "about", to: "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end