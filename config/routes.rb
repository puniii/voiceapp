Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :voices do
    collection do
    post :confirm
    get :tops
    end
  end  
end