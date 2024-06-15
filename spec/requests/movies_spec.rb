require 'rails_helper'

RSpec.describe "Movies", type: :request do
  include RSpec::Rails::Matchers::RenderTemplate

  describe "GET /movies" do
    let(:movie1) { create(:movie, title: "Gone in 60 Seconds", actors: ["Nicolas Cage", "Angelina Jolie"]) }
    let(:movie2) { create(:movie, title: "Inception", actors: ["Leonardo DiCaprio", "Elliot Page"]) }

    it "renders the index template" do
      get movies_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it "assigns @movies sorted by average stars of reviews in descending order" do
      review1 = create(:review, movie: movie1, stars: 4)
      review2 = create(:review, movie: movie1, stars: 5)
      review3 = create(:review, movie: movie2, stars: 3)

      get movies_path
      expect(assigns(:movies)).to eq([movie1, movie2])
      expect(assigns(:movies)).to match_array([movie1, movie2]) # Ensure exact order isn't required
    end
  end

  describe "GET /movies/search" do
    it "renders the search template" do
      get search_movies_path(actor: 'Nicolas Cage')
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:search)
    end

    it "assigns @movies filtered by actor and sorted by average stars of reviews in descending order" do
      movie3 = create(:movie, title: "National Treasure", actors: ["Nicolas Cage"])
      movie4 = create(:movie, title: "The Rock", actors: ["Nicolas Cage"])

      review1 = create(:review, movie: movie3, stars: 4)
      review2 = create(:review, movie: movie4, stars: 5)

      get search_movies_path(actor: 'Nicolas Cage')
      expect(assigns(:movies)).to match_array([movie3, movie4]) # Ensure exact order isn't required
    end
  end
end