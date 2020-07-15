require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  subject{ build(:bookmark) }

  context 'validations' do  
    it 'has a valid factory' do
      expect(build(:bookmark)).to be_valid  
    end

    it {expect(subject).to validate_presence_of(:title)}
    it {expect(subject).to validate_presence_of(:url)}

    it do
      should validate_length_of(:title).
      is_at_least(3).
      with_short_message('Please enter a longer bookmark title')
    end

    it do
      should validate_length_of(:title).
      is_at_most(50).
      with_long_message('Please enter a shorter title of less than 50 characters')
    end

    it do
      should validate_length_of(:description).
      is_at_most(250).
      with_long_message('Please enter a shorter description of less than 250 characters')
    end
  end
end
