Rails.application.routes.draw do
  resources :items
  resources :sliders do
    put :toggle_state, on: :member
  end

  if Rails.env.production?
    devise_for :users, skip: [:registrations]
  else
    devise_for :users
  end

  root to: "pages#welcome"
end
