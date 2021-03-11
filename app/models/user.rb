class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :friend_sent, foreign_key: :sender_id, class_name: 'Relationship'
  has_many :friend_request, foreign_key: :receiver_id, class_name: 'Relationship'
  has_many :friends, -> { merge(Relationship.friends) }, through: :friend_sent, source: :receiver
  has_many :pending_requests, -> { merge(Relationship.pendings) }, through: :friend_sent, source: :receiver
  has_many :received_requests, -> { merge(Relationship.pendings) }, through: :friend_request, source: :sender

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable

  def friend_and_own_posts
    friend_and_own_posts = []


    friends.each do |friend|
      friend.posts.each do |post|
        friend_and_own_posts << post
      end
    end

    posts.each do |post|
      next if post.new_record?
      friend_and_own_posts << post
    end

    friend_and_own_posts.uniq.sort_by(&:created_at).reverse
  end
end
