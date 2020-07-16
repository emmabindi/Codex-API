require 'rails_helper'

RSpec.describe Category, type: :model do
  subject {described_class.new(
    name: "Back End",
    user_id: 1
  )}

  context 'validations' do
    it {expect(subject).to validate_presence_of(:name)}

    it do
      should validate_length_of(:name).
      is_at_least(2).
      with_short_message('Please enter a longer category name')
    end

    it do
      should validate_length_of(:name).
      is_at_most(40).
      with_long_message('Please enter a shorter category name of less than 40 characters')
    end
  end

  context 'associations' do
    it { expect(subject).to belong_to(:user)}
  end
end
