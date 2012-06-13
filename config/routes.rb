AventonesLanding::Application.routes.draw do
  resources :surveys
  get '/stats' => 'stats#index', as: 'stats'
  root :to => 'surveys#index'
end
