class User < ActiveRecord::Base
  has_secure_password

  has_many :ratings
  has_many :comments
  has_many :favorites

  has_many :initiated_friendships, foreign_key: 'user_id', class_name: 'Friendship'
  has_many :approved_friendships, foreign_key: 'friend_id', class_name: 'Friendship'

  has_many :initiated_friends, through: :initiated_friendships, source: :user
  has_many :approved_friends, through: :approved_friendships, source: :user

  has_many :favorited_games, through: :favorites, source: :game
  has_many :votes


  validates :username, presence: "must be present", uniqueness: true
  validates :email, presence: "must be present", uniqueness: true
  validates :password, presence: "must be present"

  def confirmed_friends
    initiated_confirmed_friends = self.initiated_friendships.where(status: "confirmed").to_a.map { |friendship| friendship.friend}
    approved_confirmed_friends = self.approved_friendships.where(status: "confirmed").to_a.map { |friendship| friendship.user}
    initiated_confirmed_friends +  approved_confirmed_friends
  end

  def pending_friends
    initiated_pending_friends = self.initiated_friendships.where(status: "pending").to_a.map { |friendship| friendship.friend}
    approved_pending_friends = self.approved_friendships.where(status: "pending").to_a.map { |friendship| friendship.user}
    initiated_pending_friends +  approved_pending_friends
  end

end
