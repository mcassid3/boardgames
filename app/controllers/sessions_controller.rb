class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'Login Successful!'
      redirect_to user_path(@user)
    else
      render "restricted_access"
    end
  end


  def destroy
    session.destroy
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
