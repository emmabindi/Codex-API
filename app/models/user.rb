class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true

  def self.from_token_request request
    username = request.params["auth"] && request.params["auth"]["username"]
    self.find_by username: username
    end
end
