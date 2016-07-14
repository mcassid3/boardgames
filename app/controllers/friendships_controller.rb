class FriendshipsController < ApplicationController
  #pending friend request
  def request_friend
    @friend = User.find(params[:friend_id])
    friendship = Friendship.create(user_id: current_user.id, friend_id: @friend.id, status: "pending")

    redirect_to user_path(@friend)
  end

  def approve
    @friend = User.find(params[:friend_id])
    @friendship = find_friendship(@user)
    @friendship.status == "confirmed"
    @friendship.save
    redirect_to user_path(current_user)
  end

  def destroy
    @friend = User.find(params[:friend_id])
    @friendship = find_friendship(@friend)
    @friendship.destroy
    redirect_to user_path(current_user)
  end
end
