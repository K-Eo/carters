Rails.application.routes.draw do
  resources :items
  get "dashboards/index"
  devise_for :users
  root to: "pages#welcome"
end
