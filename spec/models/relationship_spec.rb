require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'associations' do
    it { should belong_to(:sender) }
    it { should belong_to(:receiver) }
  end
end
