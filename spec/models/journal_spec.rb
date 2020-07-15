require 'rails_helper'

RSpec.describe Journal, type: :model do
  subject { described_class.new(
    title: 'All About React Hooks',
    body: 'Today I learned about hooks in React in particular useState.'
  )}

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
  end
end
