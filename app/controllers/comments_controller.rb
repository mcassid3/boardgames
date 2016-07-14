class CommentsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(params[:comment].permit(:name, :body))
    @comment.user_id = current_user.id
    @comment.save

    redirect_to game_path(@game)
  end

end