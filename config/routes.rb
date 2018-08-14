Rails.application.routes.draw do
  resources :items
  resources :sliders
  get "dashboards/index"
  devise_for :users
  root to: "pages#welcome"
end
