RhuiHealth::Application.routes.draw do
  put "tasks/sync_aws_forum_ip_ranges"

  resources :aws_regions
  resources :home

  mount Resque::Server, :at => "/resque"

  root :to => "home#index"
end
