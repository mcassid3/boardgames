module FriendshipsHelper

  def find_friendship(friend)
    Friendship.find_by_user_id_and_friend_id(current_user.id,friend.id)
  end

  def find_pending_friendships
    current_user.friendships.find_by_status("pending")
  end

end
