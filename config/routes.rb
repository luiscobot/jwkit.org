Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  passwordless_for :users

  # Defines the root path route ("/")
  root to: redirect("groups")

  resources :field_service_groups, only: :index, path: "groups" do
    resources :publishers, only: :index do
      resources :field_service_reports, only: [:new, :create], path: "reports"
    end

    resources :field_service_reports, only: :index, path: "reports"
  end
end
