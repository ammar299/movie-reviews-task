require 'rails_helper'
require 'csv'

RSpec.describe MoviesImporter do
  describe "#import" do
    let(:csv_file) { 'lib/tasks/data/movies.csv' }

    it "imports movies from CSV file" do
      expect {
        MoviesImporter.new(csv_file).import
      }.to change(Movie, :count).by(2)

      expect(Movie.find_by(title: "Gone in 60 seconds")).to be_present
      expect(Movie.find_by(title: "Inception")).to be_present
    end
  end
end