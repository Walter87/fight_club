Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'fighters#index'
  resources :fighters
  get 'ranking', to: 'fighters#ranking'

  resources :fights do
    get 'fight_now', to: 'fights#fight_now'
  end
end
