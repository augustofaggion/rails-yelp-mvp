class Restaurant < ApplicationRecord
  # Destroy all reviews when restaurant is destroyed
  has_many :reviews, dependent: :destroy

  # Only accept if the has the 3 paramenters
  validates :name, :address, :category, presence: true
  # Checks for fixed category selection
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian)}

  def average_rating
    if reviews.any?
      reviews.average(:rating).to_i
    else
      "No reviews"
    end
  end
end
