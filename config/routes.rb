RhuiHealth::Application.routes.draw do
  resources :cds
  resources :rhuas
  resources :aws_regions
  resources :home

  mount Resque::Server, :at => "/resque"

  root :to => "home#index"
end
