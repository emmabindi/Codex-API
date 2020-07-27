class Timer < ApplicationRecord
  validates :time_length, presence: true
  belongs_to :user
end
