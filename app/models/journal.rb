class Journal < ApplicationRecord
  self.per_page = 5
  validates :title, presence: true
  validates_length_of :title, within: 3..40, too_long: 'Please enter a shorter title', too_short: 'Please enter a longer title'

  validates :body, presence: true
  validates_length_of :body,
                      in: 5..15_000,
                      too_short: 'Please enter a longer journal entry',
                      too_long: 'Please enter a shorter journal of less than 15000 characters'

  belongs_to :user
  has_one :category
end
