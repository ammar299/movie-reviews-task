require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:stars) }
  end

  describe 'associations' do
    it { should belong_to(:movie).required(true) }
  end
end