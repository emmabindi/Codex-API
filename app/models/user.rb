class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  has_many :bookmarks
  has_many :goals
  has_many :journals
end
