Rails.application.routes.draw do
  get "chatrooms/index"
  
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    unlocks: "users/unlocks",
    passwords: "users/passwords",
    omniauth: "users/omniauth",
    confirmations: "users/confirmations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "devise/registrations#create"

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  resources :chatrooms, only: %i[index show]

  resources :messages, only: %i[create]

  resources :users, only: %i[index show] do
    collection do
      get 'appendUserAttributes',  to: "users#appendUserAttributes"
      patch 'update_profile', to: "users#updateProfile"
    end
  end

  # authenticated :user do
  #   root to: 'posts#index', as: :authenticated_root  # Change 'home#index' to your actual home controller and action
  # end
end
