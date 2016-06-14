Rails.application.routes.draw do
  root "home#index"
  get 'check', to: 'home#results'
  get 'step1', to: 'home#results'
  get 'step2', to: 'home#results'
  get 'step3', to: 'home#results'
  get 'step4', to: 'home#results'
  get 'step5', to: 'home#results'
end
