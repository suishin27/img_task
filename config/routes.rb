Rails.application.routes.draw do

  root to: 'blogs#top'
  resources :favorites, only: [:create, :destroy, :favorite_list]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update] 
  get '/favorite_list/id', to: 'users#favorite_list'
  resources :blogs do
    collection do
      post :confirm
    end
  end

end
