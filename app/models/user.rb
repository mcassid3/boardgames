class User < ActiveRecord::Base
  has_secure_password

  has_many :ratings
  has_many :comments
  has_many :favorites
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'
  has_many :votes

  validates :username, presence: "must be present", uniqueness: true
  validates :email, presence: "must be present", uniqueness: true
  validates :password, presence: "must be present"

end
