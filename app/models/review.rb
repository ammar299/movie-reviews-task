class Review < ApplicationRecord

  validates :user, :movie, :stars, presence: true
  belongs_to :movie
  
end
