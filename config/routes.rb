Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    collection do
      get :edit
    end
  end
  resources :blogs do
    collection do
      post :confirm
      get '/top', to: 'blogs#top'
    end
  end
  resources :favorites, only: [:create, :destroy] do
    collection do
      get :favorite
    end
  end
end
