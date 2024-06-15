require 'rails_helper'
require 'csv'

RSpec.describe ReviewsImporter do
  describe "#import" do
    let(:csv_file) { 'lib/tasks/data/reviews.csv' }

    let!(:movie1) { create(:movie, title: "Gone in 60 seconds") }
    let!(:movie2) { create(:movie, title: "Inception") }

    it "imports reviews from CSV file" do
      expect {
        ReviewsImporter.new(csv_file).import
      }.to change(Review, :count).by(9)

      expect(movie1.reviews.count).to eq(5)
      expect(movie2.reviews.count).to eq(4)
    end
  end
end