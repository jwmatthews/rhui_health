RhuiHealth::Application.routes.draw do
  resources :aws_regions
  resources :home

  mount Resque::Server, :at => "/resque"

  root :to => "home#index"
end
