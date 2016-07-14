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

post '/friendships/request' => 'friendships#request_friend', as: :friend_request
post '/friendships/approval' => 'friendships#approve', as: :friend_approval
delete '/friendships/remove' => 'friendships#destroy', as: :friend_removal

end
