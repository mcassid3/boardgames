module FriendshipsHelper

  def find_friendship(friend)
    Friendship.find_by_user_id_and_friend_id(current_user.id,friend.id)
  end

  def find_pending_friends
    @pending_friendships = Friendship.where(friend_id: current_user.id, status: 'pending')
      @pending_friends = @pending_friendships.map do |pending_friendship|
          User.find(pending_friendship.friend_id)
      end
  end

end
