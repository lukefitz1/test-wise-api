Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    post '/scenarios/create_scenario', to: 'scenarios#create_scenario'

    resources :steps
    resources :scenarios
    resources :features
    resources :projects
    resources :organizations
  end
end
