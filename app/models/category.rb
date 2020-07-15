class Category < ApplicationRecord
  belongs_to :categorizable, polymorphic: true
  validates :name, presence: true

  validates_length_of :name, 
  minimum: 2,
  too_short: 'Please enter a longer category name'
end
