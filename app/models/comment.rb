class Comment < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_many :votes

  validates :body, presence: true
end
