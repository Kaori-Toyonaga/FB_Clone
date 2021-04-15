Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
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
