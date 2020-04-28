class Relationship < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id

  enum status: { pending: 0,  approved: 1, rejected: 2 }

  scope :friends, -> { where(status: :approved) }
  scope :pendings, -> { where(status: :pending) }
  scope :not_friends, -> { where(status: :rejected) }
end
