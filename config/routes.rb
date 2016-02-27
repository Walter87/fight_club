Rails.application.routes.draw do
  root 'fighters#index'
  resources :fighters
  get 'ranking', to: 'fighters#ranking'

  resources :fights do
    get 'fight_now', to: 'fights#fight_now'
  end
end
