require 'rails_helper'

RSpec.describe Goal, type: :model do
  # subject {build(:goal)}
  subject {described_class.new(
    title: "Implement Styled Components",
    body: "Utilise styled components with a React app for the first time",
    due_date: "2020-09-30",
    completed: true,
    user_id: 1
  )}

  context 'validations' do
    # it 'has a valid factory' do 
    #   expect(build(:goal)).to be_valid
    # end

    it {expect(subject).to validate_presence_of(:title)}
    it {expect(subject).to validate_presence_of(:due_date)}
    it {expect(subject.completed).to be_in([true, false])}

    it do
      should validate_length_of(:title).
      is_at_least(3).
      with_short_message('Please enter a longer goal title')
    end

    it do
      should validate_length_of(:title).
      is_at_most(40).
      with_long_message('Please enter a shorter title of less than 40 characters')
    end

    it do
      should validate_length_of(:body).
      is_at_most(350).
      with_long_message('Please enter a shorter goal description of less than 350 characters')
    end
  end

  context 'associations' do
    it { expect(subject).to belong_to(:user)}
  end
end
