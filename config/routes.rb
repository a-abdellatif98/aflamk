Rails.application.routes.draw do
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "movies#index"
end
