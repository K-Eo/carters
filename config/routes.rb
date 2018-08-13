Rails.application.routes.draw do
  get 'pages/wellcome'
  root :to=> 'pages#wellcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
