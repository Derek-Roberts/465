Rails.application.routes.draw do
  root "home#index"
  get 'check', to: 'home#show'
  get 'step1', to: 'home#show'
  get 'step2', to: 'home#show'
  get 'step3', to: 'home#show'
  get 'step4', to: 'home#show'
  get 'step5', to: 'home#show'
end
