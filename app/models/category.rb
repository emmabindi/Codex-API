class Category < ApplicationRecord
  belongs_to :categorizable, polymorphic: true
  belongs_to :user

  has_many :categorizables
end
