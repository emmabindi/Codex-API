require 'rails_helper'

RSpec.describe Journal, type: :model do
  # subject {build(:journal)}
  subject do
    described_class.new(
      title: 'Day 1 of 100 Days of Code',
      body: "If you're on Twitter and you're even slightly involved in the dev community, there's a chance you've seen the #100DaysOfCode hashtag floating around. As of this first journal entry, I am holding myself accountable to spend 1 hour coding every day for 100 days and to keep a daily log of my learnings, progress, discoveries and questions",
      user_id: 1
    )
  end

  context 'validations' do
    # it 'is valid with valid attributes' do
    #   expect(subject).to be_valid
    # end

    # it 'has a valid factory' do
    #   expect(build(:journal)).to be_valid
    # end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a title less than 3 characters' do
      subject.title = 'a'
      expect(subject).to_not be_valid
    end

    it 'is not valid with a title greater than 40 characters' do
      subject.title = '12345678901234567890123456789012345678901234567890'
      expect(subject).to_not be_valid
    end

    it 'is not valid without a body' do
      subject.body = nil
      expect(subject).to_not be_valid
    end

    it do
      should validate_length_of(:body)
        .is_at_least(5)
        .with_short_message('Please enter a longer journal entry')
    end

    it do
      should validate_length_of(:body)
        .is_at_most(15_000)
        .with_long_message('Please enter a shorter journal of less than 15000 characters')
    end
  end

  context 'associations' do
    it { expect(subject).to belong_to(:user) }
    it { expect(subject).to have_many(:categories).through(:category_joins) }
  end
end
