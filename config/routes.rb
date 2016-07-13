Rails.application.routes.draw do

 root 'games#index'

 resources :games do
  resources :comments
end

resources :users
resources  :tags, only: [:show]

end
