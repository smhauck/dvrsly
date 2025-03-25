Rails.application.routes.draw do
  resources :ban_reasons

  resources :blogs, path: "/b" do
    resources :posts, path: "p", only: [:index, :new, :create, :edit, :update]
  end

  resources :diversions, path: "/d" do
    resources :posts, path: "p", only: [:index, :new, :create, :edit, :update]
  end

  resources :posts, path: "/p" do
    resources :comments, path: "c", only: [:index, :new, :create, :edit, :update]
  end

  resources :posts, path: "/p", only: [:index, :new, :create, :edit, :show, :update, :destroy]

  resources :comments, path: "/c", only: [:show, :destroy]

  resources :users, path: "/u", only: [:index, :show] do
    resources :blogs, path: "b", only: [:index, :show]
    resources :comments, path: "c", only: [:index, :show]
    resources :posts, path: "p", only: [:index, :show]
  end

  resource :registration
  resource :session
  resources :passwords, param: :token


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
  # get "user/comments"
  # get "user/posts" => "user#posts"
  # get "user/profile"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "posts#index"
end
