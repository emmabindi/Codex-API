class Bookmark < ApplicationRecord
  self.per_page = 5

  validates :title, presence: true
  validates :url, presence: true

  validates_length_of :title,
                      in: 3..50,
                      too_short: 'Please enter a longer bookmark title',
                      too_long: 'Please enter a shorter title of less than 50 characters'

  validates_length_of :description, 
    maximum: 250, 
    too_long: 'Please enter a shorter description of less than 250 characters'

  validates_length_of :category,
  in: 2..40,
  too_short: 'Please enter a longer category name',
  too_long: 'Please enter a shorter category name of less than 40 characters'

  belongs_to :user, dependent: :destroy
end
