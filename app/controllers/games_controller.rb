class GamesController < ApplicationController
  include RatingsHelper
  def index
    # @games = Game.all
    @games = Game.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @game = Game.find(params[:id])
    if current_user
      @prev_rating = Rating.find_by(user_id: current_user.id, game_id: @game.id)
    end
    @rating = Rating.new(game_id: params[:game_id])
    @average_rating = find_average_rating(@game)
  end

  def find
    @game = Game.find_by(title: params[:title])
  end

  private
    def game_params
      params.require(:game).permit(:id, :title)
    end
end
