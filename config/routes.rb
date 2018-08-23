Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :animals, only: [:index, :show, :create]
      resources :users, only: [:show, :create]
      resources :favorites, only: [:index]
      resources :messages, only: [:index,:create]
      post '/signin', to: "users#signin"
      patch '/userfavorites', to: "users#favorite"
      delete "users/delete_favorite"


    end
  end
end
