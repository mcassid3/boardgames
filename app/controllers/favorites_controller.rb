class FavoritesController < ApplicationController
  def create
    @fav = Favorite.where(game_id: params[:game_id], user_id: current_user.id).first_or_initialize
    if @fav.save
      redirect_to user_path(current_user.id)
    else
      render :restricted_access
    end
  end

  def destroy
    redirect_to restricted_access unless authorized?(current_user)
    @fav = Favorite.find_by(user_id: current_user.id, game_id: params[:game_id]).destroy
    redirect_to user_path(current_user.id)
  end

  # def favorite_params
  #   params.require(:favorite).permit(:game_id)
  # end
end
