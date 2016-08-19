class UsersController < ApplicationController
  include FriendshipsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:notice] = 'Invalid Parameters. Try again'
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @friendship = find_friendship_with(@user)
    @initiated_pending_friends = @user.initiated_pending_friends
    @approved_pending_friends = @user.approved_pending_friends
    @confirmed_friends = @user.confirmed_friends
  end

  def edit
    @user = User.find(params[:id])
    if authorized?(@user)
      render :new
    else
      render :restricted_access
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user.id)
 
  end

  def destroy
    session.destroy
    @user = User.find(params[:id]).destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username,:email, :password, :password_cofirmation)
  end
end
