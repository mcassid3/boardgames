class RatingsController < ApplicationController
  def show
  end

  def create
    @rating = Rating.create(user_id: current_user.id, game_id: params[:game_id], rating: params[:rating]["rating"] )
    redirect_to game_path(Game.find(params[:game_id]))
  end

  def update
    @rating = Rating.where(user_id: current_user.id, game_id: params[:game_id])
    @rating[:rating] = params[:rating]
    redirect_to user_path
  end
end
