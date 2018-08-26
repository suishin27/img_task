Rails.application.routes.draw do

  root to: 'blogs#top'
  resources :favorites, only: [:create, :destroy, :favorite_list]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update] do
    collection do
      get :favorite_list
    end
  end
  resources :blogs do
    collection do
      post :confirm
    end
  end

end
