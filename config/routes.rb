Rails.application.routes.draw do

 root 'games#index'

 resources :games do
  resources :comments
end

resources :users

get '/logout' => 'sessions#destroy'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'


resources  :tags, only: [:show]

resources :friendships, only: [:new, :create, :destroy]

end
