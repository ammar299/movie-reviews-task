class ReviewsImporter
  
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def import
    CSV.foreach(@csv_file, headers: true) do |row|
      import_review(row)
    end
  end

  private

  def import_review(row)
    movie = Movie.find_by(title: row['Movie'])
    return unless movie

    movie.reviews.create!(
      user: row['User'],
      stars: row['Stars'].to_i,
      comment: row['Review']
    )
  end

end