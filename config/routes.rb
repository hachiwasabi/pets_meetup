Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy]
  end

  devise_for :users,controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    get "search", to: "searches#index", as: "search"
    resources :posts
    resources :users, only: [:edit, :update, :show] do
      member do
        get :mypage
        patch :withdraw
      end
    end
  end

  root :to =>"homes#top"
  get "about", to: "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
