class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    session[:user_id] = current_user.id
    flash[:notice] = 'Login Successful!'
    redirect_to user_path
  end





  def destroy
    session.destroy
    redirect_to root_path
  end
end
