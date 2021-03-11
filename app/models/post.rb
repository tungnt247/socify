class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :title, length: { maximum: 250 }, uniqueness: { case_sensitive: false }
    validates :content
  end

  mount_uploader :image, ImageUploader
end
