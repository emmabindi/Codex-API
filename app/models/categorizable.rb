class Categorizable < ApplicationRecord
  belongs_to :categorizable, polymorphic: true
  has_many :categories
end
