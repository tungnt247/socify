class User < ApplicationRecord
  has_many :posts
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Relationship'
  has_many :following_users, foreign_key: :followee_id, class_name: 'Relationship'
  has_many :followers, through: :following_users
  has_many :followees, through: :followed_users

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable
end
