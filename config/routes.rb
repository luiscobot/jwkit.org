Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  passwordless_for :users

  # Defines the root path route ("/")
  root to: redirect('groups')

  get "groups", to: "field_service_groups#index", as: "field_service_groups"
  get "groups/:field_service_group_id/publishers", to: "publishers#index", as: "field_service_group_publishers"
  get "groups/:field_service_group_id/reports", to: "field_service_reports#index", as: "field_service_group_reports"

  get "publishers/:publisher_id/reports/new", to: "field_service_reports#new", as: "new_publisher_field_service_report"

  resources :field_service_reports
end
