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

  # resources :users, path: "/u", only: [:index, :show] do
  resources :users, path: "/u" do
    resources :blogs, path: "b", only: [:index, :show]
    resources :comments, path: "c", only: [:index, :show]
    resources :posts, path: "p", only: [:index, :show]
  end

  resource :registration
  resource :session
  resources :passwords, param: :token

  get "pages/about"
  get "pages/changelog"
  get "pages/faq"
  get "pages/index"
  get "pages/privacy"
  get "pages/roadmap"
  get "pages/terms"
  get "about" => "pages#about"
  get "changelog" => "pages#changelog"
  get "faq" => "pages#faq"
  get "privacy" => "pages#privacy"
  get "roadmap" => "pages#roadmap"
  get "terms" =>"pages#terms"

  resources :pages

  # Pages stored in database. /pages/page.title shows the page from the db
#  get "doc/:link", to: "pages#show", as: :doc




  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "posts#index"
end
