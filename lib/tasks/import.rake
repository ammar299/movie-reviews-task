require 'csv'

namespace :import do
  task movies: :environment do
    MoviesImporter.new('lib/tasks/data/movies.csv').import
  end

  task reviews: :environment do
    ReviewsImporter.new('lib/tasks/data/reviews.csv').import
  end
end