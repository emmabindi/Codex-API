require 'rails_helper'

RSpec.describe Journal, type: :model do
  subject {build(:journal)}

  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

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
      should validate_length_of(:body).
      is_at_least(5).
      with_short_message('Please enter a longer journal entry')
    end

    it do
      should validate_length_of(:body).
      is_at_most(15000).
      with_long_message('Please enter a shorter journal of less than 15000 characters')
    end
  end
end
