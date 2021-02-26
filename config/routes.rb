Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :steps
    resources :scenarios
    resources :features
    resources :projects
    resources :organizations
  end
end
