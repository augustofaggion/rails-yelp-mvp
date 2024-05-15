class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  # Check if the number is 0 <= 5
  validates :rating, presence: true, numericality: { only_integer: true, in: 0..5 }
end
