class Bookmark < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true

  validates_length_of :title, 
  in: 3..50,
  too_short: 'Please enter a longer bookmark title',
  too_long: 'Please enter a shorter title of less than 50 characters'

  validates_length_of :description, maximum: 250, too_long: 'Please enter a shorter description of less than 250 characters'

  belongs_to :user
end
