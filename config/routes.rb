Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :field_service_groups, path: 'groups', only: [:index] do
    resources :publishers, only: [:index]
  end

  get "/publishers/:publisher_id/reports/new", to: "field_service_reports#new"
end
