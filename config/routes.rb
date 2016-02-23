Rails.application.routes.draw do
  root 'fighters#index'
  resources :fighters
  resources :fights
end
