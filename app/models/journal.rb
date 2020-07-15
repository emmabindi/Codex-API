class Journal < ApplicationRecord
  validates :title, presence: true
  validates_length_of :title, :within => 3..40, :too_long => "Please enter a shorter title", :too_short => "Please enter a longer title"

  validates :body, presence: true
  validates_length_of :body, 
    in: 5..15000,
    too_short: 'Please enter a longer journal entry',
    too_long: 'Please enter a shorter journal of less than 15000 characters'
end