class GamesController < ApplicationController
  include RatingsHelper
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    if current_user
      @prev_rating = Rating.find_by user_id: current_user.id
      # p @prev_rating
    end
    @rating = Rating.new(game_id: params[:game_id])
    @average_rating = find_average_rating(@game)
  end

  private
    def game_params
      params.require(:game).permit(:id, :title)
    end
end
