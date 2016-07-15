Rails.application.routes.draw do

root 'games#index'

resources :games do
  resources :comments
  resources :favorites, only: [:create, :destroy]
  resources :ratings
end

resources :users

get '/logout' => 'sessions#destroy'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create', as: :sessions

get '/comments/:comment_id/votes' => 'votes#index', as: :comment_votes
post '/comments/:comment_id/votes' => 'votes#create', as: :update_votes

resources  :tags, only: [:show]

post '/friendships/request' => 'friendships#request_friend', as: :friend_request
post '/friendships/approval' => 'friendships#approve_friend', as: :friend_approval
delete '/friendships/remove' => 'friendships#destroy', as: :friend_removal

end
