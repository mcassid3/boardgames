class TagsController < ApplicationController
  def show
    @games=Game.where(:category => params[:id])
    render 'index'
  end
end
