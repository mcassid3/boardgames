class VotesController < ApplicationController

  def index
  end

  def create
    @comment = Comment.find(params[:comment_id])

    @vote = Vote.new(comment_id: params[:comment_id], user_id: current_user.id)
    if params[:vote] == "0"
      @vote.vote = -1
    else
      @vote.vote = 1
    end

    @vote.save

    redirect_to game_path(@comment.game.id)
  end

end
