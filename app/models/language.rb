class Language < ApplicationRecord
  has_many :bookmarks
  has_many :goals
  has_many :journals

  validates :name, presence: true

  validates :name,
            length: { in: 2..40,
                      too_short: 'Please enter a longer language name',
                      too_long: 'Please enter a shorter language name of less than 40 characters' }
end
