Rails.application.routes.draw do
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  resources :contacts
  
  root to: 'voices#tops'
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :voices do
    #get "index" => "favorites#index" #favoriteにvoiceのidを紐付けます。
    collection do
    post :confirm
    get :tops
    end
  end
end