Rails.application.routes.draw do
  resources :posts
  resource :session
  resource :registration
  resources :passwords, param: :token
  resources :users, only: [:index, :show] do
    resources :posts
  end
  get "about" => "pages#about"
  get "faq" => "pages#faq"
  get "pages/about"
  get "pages/faq"
  get "pages/index"
  get "pages/privacy"
  get "pages/roadmap"
  get "pages/terms"
  get "privacy" => "pages#privacy"
  get "roadmap" => "pages#roadmap"
  get "terms" =>"pages#terms"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "posts#index"
end
