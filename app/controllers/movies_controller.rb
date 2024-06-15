class MoviesController < ApplicationController

  def index
    @movies= Movie.sorted_by_average_stars
  end

  def search
    @movies = Movie.with_actor_like(params[:actor])
    @movies = @movies.left_joins(:reviews).group(:id).order('AVG(reviews.stars) DESC')
  end
  
end