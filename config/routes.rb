Rails.application.routes.draw do
  resources:voices do
    collection do
    post :confirm
    end
  end
end
