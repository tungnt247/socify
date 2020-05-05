class User < ApplicationRecord
  has_many :posts
  has_many :friend_sent, foreign_key: :sender_id, class_name: 'Relationship'
  has_many :friend_request, foreign_key: :receiver_id, class_name: 'Relationship'

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable
end
