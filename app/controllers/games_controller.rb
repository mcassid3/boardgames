class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    p session[:id]
    @game = Game.find(params[:id])
    # @game.comments.user_id = session[:id]
  end
end
