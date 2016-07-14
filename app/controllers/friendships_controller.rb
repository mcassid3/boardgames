class FriendshipsController < ApplicationController
  include FriendshipsHelper
  def request_friend
    @friend = User.find(params[:friend_id])
    friendship = Friendship.create(user_id: current_user.id, friend_id: @friend.id, status: "pending")
    redirect_to user_path(@friend)
  end

  def approve_friend
    @friend = User.find(params[:user_id])
    @friendship = find_friendship_with(@friend)
    @friendship.status = "confirmed"
    @friendship.save
    redirect_to user_path(current_user)
  end

  def destroy
    @friend = User.find(params[:friend_id])
    @friendship = find_friendship_with(@friend)
    @friendship.destroy
    redirect_to user_path(current_user)
  end
end
