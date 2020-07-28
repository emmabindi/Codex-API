class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :username, presence: true

  has_many :bookmarks, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :journals, dependent: :destroy
  has_many :timers, dependent: :destroy
end
