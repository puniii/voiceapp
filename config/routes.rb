Rails.application.routes.draw do
  resources:voices do
    collection do
    post :confirm
    get :tops
    end
  end
end
