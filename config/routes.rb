Rails.application.routes.draw do
  resources :items
  resources :sliders

  if Rails.env.production?
    devise_for :users, skip: [:registrations]
  else
    devise_for :users
  end

  root to: "pages#welcome"
end
