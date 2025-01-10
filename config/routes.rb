Rails.application.routes.draw do
  resource :unsubscribe, only: [ :show ]

  resource :session
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
  end

  get "/products", to: "products#index"

  get "/products/new", to: "products#new"
  post "/products", to: "products#create"

  get "/products/:id", to: "products#show"

  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"
  put "/products/:id", to: "products#update"
  get 'login', to: 'sessions#new', as: 'login'

  delete "/products/:id", to: "products#destroy"

  root "products#index"
end
