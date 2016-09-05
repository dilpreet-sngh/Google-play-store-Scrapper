Rails.application.routes.draw do

  resource :home, only: :show

  resources :crawlers, only: :create do
    collection do
      delete :delete
    end
  end
  resources :apps, only: :show

  root 'home#show'
end
