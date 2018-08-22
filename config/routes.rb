Rails.application.routes.draw do
  resources :categories, except: [:show]
  resources :items, except: [:show]
  resources :sliders do
    put :toggle_state, on: :member
  end

  if Rails.env.production?
    devise_for :users, skip: [:registrations]
  else
    devise_for :users
  end

  get "pages/contact"
  get "pages/services"

  root to: "pages#welcome"
end
