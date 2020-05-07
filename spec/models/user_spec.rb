require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts).class_name('Post') }
    it { should have_many(:friend_sent) }
    it { should have_many(:friend_request) }
    it { should have_many(:comments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should allow_value('email@gmail.com').for(:email) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
