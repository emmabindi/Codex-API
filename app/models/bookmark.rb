class Bookmark < ApplicationRecord
  self.per_page = 5

  validates :title, presence: true
  validates :url, presence: true

  validates :title,
            length: { in: 3..50,
                      too_short: 'Please enter a longer bookmark title',
                      too_long: 'Please enter a shorter title of less than 50 characters' }

  validates :description,
            length: { maximum: 250,
                      too_long: 'Please enter a shorter description of less than 250 characters' }

  belongs_to :user, dependent: :destroy
  belongs_to :category
  belongs_to :language
end
