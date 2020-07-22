require 'rails_helper'

RSpec.describe Language, type: :model do
  subject{ build(:language) }

  context 'validations' do
    it 'has a valid factory' do
      expect(build(:language)).to be_valid
    end

    it { expect(subject).to validate_presence_of(:name) }

    it do
      should validate_length_of(:name)
        .is_at_least(2)
        .with_short_message('Please enter a longer language name')
    end

    it do
      should validate_length_of(:name)
        .is_at_most(40)
        .with_long_message('Please enter a shorter language name of less than 40 characters')
    end
  end

  context 'associations' do
    it { expect(subject).to have_many(:bookmarks) }
    it { expect(subject).to have_many(:goals) }
    it { expect(subject).to have_many(:journals) }
  end
end
