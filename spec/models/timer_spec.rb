require 'rails_helper'

RSpec.describe Timer, type: :model do
  subject { build(:timer) }

  context 'validations' do
    it 'has a valid factory' do
      expect(build(:timer)).to be_valid
    end

    it { expect(subject).to validate_presence_of(:time_length) }
  end

  context 'associations' do
    it { expect(subject).to belong_to(:user) }
  end
end
