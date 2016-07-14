module FriendshipsHelper

  def find_friendship_with(friend)
    my_initiated_friendship = Friendship.find_by_user_id_and_friend_id(current_user.id, friend.id)

    friend_initiated_friendship = Friendship.find_by_user_id_and_friend_id(friend.id, current_user.id)

    return my_initiated_friendship if my_initiated_friendship
    return friend_initiated_friendship if friend_initiated_friendship
  end

end
