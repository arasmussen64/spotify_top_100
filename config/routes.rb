Rails.application.routes.draw do
  get 'artists/index'
  get 'artists/new'
  root 'billboards#index'

  resources :billboards
  resources :songs do
    resources :artists, only: [:index, :new, :create, :destroy]
  end
end
