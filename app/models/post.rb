class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  with_options presence: true do
    validates :title, length: { maximum: 250 }
    validates :content
  end
end
