Rails.application.routes.draw do
  root to: 'voices#tops'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :voices do
    collection do
    post :confirm
    get :tops
    end
  end  
end