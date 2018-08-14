Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :animals, only: [:index, :show, :create]
      resources :users, only: [:show, :create]

      post '/signin', to: "users#signin"
    end
  end
end
