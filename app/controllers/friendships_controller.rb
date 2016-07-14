class FriendshipsController < ApplicationController
  def create
    @friend = User.find(params[:friend_id])
    p "KAJSHDK JAHSD KJASHDJK AHS "
    p @friend
    p "BCMNXBCMNZXBNCB ZXNCB"
    p params
    friendship = Friendship.create(user_id: params[:user_id], friend_id: @friend.id, status: "pending")
    p "YYYYYYYY"
    p friendship.status
    redirect_to user_path(@friend)
  end

  def approve

  end

  def destroy

  end
end
