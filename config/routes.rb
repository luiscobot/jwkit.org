Rails.application.routes.draw do
  get 'publishers/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :field_service_groups, path: 'groups', only: [:index] do
    resources :publishers, only: [:index]
  end
end
