class Mypet < ApplicationRecord
  belongs_to :user
  validates :petname, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }
  validates :age, numericality: { only_integer: true }
end
