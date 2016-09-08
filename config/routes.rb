Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    resources :applications
  end

  root 'welcome#index'
  get 'welcome/about'

  namespace :api, defaults: { format: :json } do
     match '/events', to: 'events#preflight', via: [:options]
     resources :events, only: [:create]
   end
end
