require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations' do  

    # has a valid factory  ?

    it { is_expected.to have_db_column(:categorizable_id).of_type(:integer)}
    it { is_expected.to have_db_column(:categorizable_type).of_type(:string)}
    
    it {expect(subject).to validate_presence_of(:name)}

    it do
      should validate_length_of(:name).
      is_at_least(2).
      with_short_message('Please enter a longer category name')
    end
  end

  context 'associations' do
    it { is_expected.to belong_to(:categorizable)}
  end
end
