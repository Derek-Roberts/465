Rails.application.routes.draw do
  root "home#index"
  get 'query', to: 'home#show'
end
