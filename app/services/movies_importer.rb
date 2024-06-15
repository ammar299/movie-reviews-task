class MoviesImporter
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def import
    CSV.foreach(@csv_file, headers: true) do |row|
      import_movie(row)
    end
  end

  private

  def import_movie(row)
    movie = Movie.find_or_initialize_by(title: row['Movie'])
    movie.description = row['Description']
    movie.year = row['Year'].to_i

    new_directors = row['Director'].split(', ')
    existing_directors = movie.director || []
    movie.director = (existing_directors + new_directors).uniq

    new_actors = row['Actor'].split(', ')
    existing_actors = movie.actors || []
    movie.actors = (existing_actors + new_actors).uniq

    new_filming_locations = row['Filming location'].split(', ')
    existing_filming_locations = movie.filming_locations || []
    movie.filming_locations = (existing_filming_locations + new_filming_locations).uniq

    new_countries = row['Country'].split(', ')
    existing_countries = movie.country || []
    movie.country = (existing_countries + new_countries).uniq

    movie.save!
  end
  
end