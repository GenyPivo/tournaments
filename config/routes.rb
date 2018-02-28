Rails.application.routes.draw do
  devise_for :users, only: [:omniauth_callbacks, :sessions],
             controllers: { omniauth_callbacks: "users/omniauth_callbacks" },
             path: ''
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'root#index'
  get 'log_in', to: 'root#log_in'

  resources :teams

end
