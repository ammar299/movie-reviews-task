class Movie < ApplicationRecord
  
  has_many :reviews
  validates :title, :year, :director, :filming_locations, :actors, :country, presence: true

  scope :with_actor_like, ->(actor_name) {
    where("array_to_string(actors, ',') LIKE ?", "%#{actor_name}%")
  }
  scope :sorted_by_average_stars, -> {
    joins(:reviews)
      .group('movies.id')
      .order('AVG(reviews.stars) DESC')
  }

  def average_rating
    reviews.average(:stars).to_f
  end

end