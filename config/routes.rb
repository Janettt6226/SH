Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :games, only: %i[show new create] do
    get "setup", to: "games#setup"
    resources :players, only: %i[show new create] do
      collection do
        get :update_president
        patch :save_president
        get :update_chancelier
        patch :save_chancelier
      end
    end
    resources :players, only: %i[edit update]
    resources :rounds, only: %i[index show new create edit update]
    resources :boards, only: %i[show new create edit update]
  end
end
