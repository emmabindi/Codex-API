class Goal < ApplicationRecord
  self.per_page = 5

  validates :title, presence: true
  validates :due_date, presence: true
  validates :completed, inclusion: { in: [true, false] }

  validates :title,
            length: { in: 3..40,
                      too_short: 'Please enter a longer goal title',
                      too_long: 'Please enter a shorter title of less than 40 characters' }

  validates :body,
            length: { maximum: 350,
                      too_long: 'Please enter a shorter goal description of less than 350 characters' }

  belongs_to :user
  belongs_to :category
  belongs_to :language
end
