class Category < ApplicationRecord
  has_many :bookmarks
  has_many :goals
  has_many :journals

  validates :name, presence: true

  validates_length_of :name,
  in: 2..40,
  too_short: 'Please enter a longer category name',
  too_long: 'Please enter a shorter category name of less than 40 characters'
end
