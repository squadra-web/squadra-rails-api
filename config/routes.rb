Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/users/me', to: 'users#me'
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :teams, only: [:index, :show, :create, :update, :destroy, :players]
      resources :teams do
        get 'players', on: :member
      end
      resources :players, only: [:index, :show, :create, :update, :destroy, :create_bulk] do
        collection do
          post :create_bulk
        end
      end
      resources :modalities, only: [:index, :show, :create, :update, :destroy]
      resources :line_ups, only: [:index, :show, :create, :update, :destroy]
      resources :groups, only: [:index, :show, :create, :update, :destroy]
      resources :groups do
        get 'teams', on: :member
      end
      post '/auth/login', to: 'authentication#login'
      get '/*a', to: 'application#not_found'
    end
  end
end
