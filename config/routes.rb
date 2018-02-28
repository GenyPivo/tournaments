Rails.application.routes.draw do
  devise_for :users, only: [:omniauth_callbacks, :sessions],
             controllers: { omniauth_callbacks: "users/omniauth_callbacks" },
             path: ''
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'teams#index'

  resources :teams
  resources :tournaments do
    collection do
      post :exit
      post :participate
    end
  end
end
