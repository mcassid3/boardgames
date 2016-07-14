class User < ActiveRecord::Base
  has_secure_password

  has_many :ratings
  has_many :comments
  has_many :favorites
  has_many :friendships, foreign_key: 'user_id', class_name: 'Friendship'
  has_many :friends, through: :friendships, class_name: 'User'
  has_many :favorited_games, through: :favorites, source: :game
  has_many :votes


  validates :username, presence: "must be present", uniqueness: true
  validates :email, presence: "must be present", uniqueness: true
  validates :password, presence: "must be present"



end
