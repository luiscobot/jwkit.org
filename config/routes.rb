Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "groups", to: "field_service_groups#index", as: "field_service_groups"
  get "groups/:field_service_group_id/publishers", to: "publishers#index", as: "field_service_group_publishers"
  get "publishers/:publisher_id/reports/new", to: "field_service_reports#new", as: "new_publisher_field_service_report"
end
