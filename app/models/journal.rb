class Journal < ApplicationRecord
  self.per_page = 5
  validates :title, presence: true
  validates :title,
            length: {
              within: 3..40,
              too_long: 'Please enter a shorter title',
              too_short: 'Please enter a longer title'
            }

  validates :body, presence: true
  validates :body,
            length: { in: 5..15_000,
                      too_short: 'Please enter a longer journal entry',
                      too_long: 'Please enter shorter journal of <15000 characters' }

  belongs_to :user
  belongs_to :category
  belongs_to :language
end
