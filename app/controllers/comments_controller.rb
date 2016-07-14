class CommentsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.create(params[:comment].permit(:name, :body))

    redirect_to game_path(@game)
  end

end