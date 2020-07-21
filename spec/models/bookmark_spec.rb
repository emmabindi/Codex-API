require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  # subject{ build(:bookmark) }
  subject do
    described_class.new(
      title: 'Rails Techniques: Using Polymorphic Associations',
      description: 'Helpful article explaining the how and why for use of polymorphic associations in Rails, has model examples',
      url: 'https://semaphoreci.com/blog/2017/08/16/polymorphic-associations-in-rails.html',
      user_id: 1
    )
  end

  context 'validations' do
    # it 'has a valid factory' do
    #   expect(build(:bookmark)).to be_valid
    # end

    it { expect(subject).to validate_presence_of(:title) }
    it { expect(subject).to validate_presence_of(:url) }

    it do
      should validate_length_of(:title)
        .is_at_least(3)
        .with_short_message('Please enter a longer bookmark title')
    end

    it do
      should validate_length_of(:title)
        .is_at_most(50)
        .with_long_message('Please enter a shorter title of less than 50 characters')
    end

    it do
      should validate_length_of(:description)
        .is_at_most(250)
        .with_long_message('Please enter a shorter description of less than 250 characters')
    end
  end

  context 'associations' do
    it { expect(subject).to belong_to(:user) }
  end
end
