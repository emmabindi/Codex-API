class Journal < ApplicationRecord
  validates :title, presence: true
  validates_length_of :title, :within => 3..40, :too_long => "Please enter a shorter title", :too_short => "Please enter a longer title"
end
