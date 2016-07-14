class FavoritesController < ApplicationController
  def create
    @fav = Favorite.new(game_id: params[:game_id], user_id: current_user.id)
    if @fav.save
      redirect_to user_path(current_user.id)
    else
      render :restricted_access
    end
  end

  # def favorite_params
  #   params.require(:favorite).permit(:game_id)
  # end
end
