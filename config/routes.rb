Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :teams, only: [:index, :show, :create, :update, :destroy, :players]
      resources :teams do
        get 'players', on: :member
      end
      resources :players, only: [:index, :show, :create, :update, :destroy]
      resources :modalities, only: [:index, :show, :create, :update, :destroy]
      resources :line_ups, only: [:index, :show, :create, :update, :destroy]
      post '/auth/login', to: 'authentication#login'
      get "/me", to: "users#me"
      get '/*a', to: 'application#not_found'
    end
  end
end
