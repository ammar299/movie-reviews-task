require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:director) }
    it { should validate_presence_of(:filming_locations) }
    it { should validate_presence_of(:actors) }
    it { should validate_presence_of(:country) }
  end

  describe '.with_actor_like' do
    before do
      @movie1 = Movie.create(
        title: "Movie One",
        year: 2000,
        director: ["Dominic Sena"],
        filming_locations: ["Los Angeles", "Lone Pine"],
        actors: ["Nicolas Cage", "Leonardo DiCaprio"],
        country: ["US"]
      )
      @movie2 = Movie.create(
        title: "Movie Two",
        year: 2001,
        director: ["Steven Spielberg"],
        filming_locations: ["New York"],
        actors: ["Tom Hanks", "Will Smith"],
        country: ["US"]
      )
      @movie3 = Movie.create(
        title: "Movie Three",
        year: 2002,
        director: ["Michael Bay"],
        filming_locations: ["San Francisco"],
        actors: ["Nicolas Cage", "Tom Cruise"],
        country: ["US"]
      )
      @movie4 = Movie.create(
        title: "Movie Four",
        year: 2003,
        director: ["Christopher Nolan"],
        filming_locations: ["Chicago"],
        actors: ["Nicolas", "John Doe"],
        country: ["US"]
      )
    end

    it 'returns movies where the actors array contains the given name' do
      results = Movie.with_actor_like('Nicolas')
      expect(results).to include(@movie1, @movie3, @movie4)
      expect(results).not_to include(@movie2)
    end

    it 'is case sensitive' do
      results = Movie.with_actor_like('nicolas')
      expect(results).to be_empty
    end

    it 'returns partial matches' do
      results = Movie.with_actor_like('Nic')
      expect(results).to include(@movie1, @movie3, @movie4)
      expect(results).not_to include(@movie2)
    end

    it 'handles empty results' do
      results = Movie.with_actor_like('Nonexistent Actor')
      expect(results).to be_empty
    end
  end

  describe "#average_rating" do
    let(:movie) { create(:movie) }
    
    context "when the movie has reviews" do
      before do
        create(:review, movie: movie, stars: 4)
        create(:review, movie: movie, stars: 5)
      end
      
      it "calculates the correct average rating" do
        expect(movie.average_rating).to eq(4.5)
      end
    end
    
    context "when the movie has no reviews" do
      it "returns 0.0" do
        expect(movie.average_rating).to eq(0.0)
      end
    end
  end

  describe ".sorted_by_average_stars" do
    let!(:movie1) { create(:movie, title: "Movie 1") }
    let!(:movie2) { create(:movie, title: "Movie 2") }
    
    before do
      create(:review, movie: movie1, stars: 4)
      create(:review, movie: movie1, stars: 5)
      create(:review, movie: movie2, stars: 3)
    end
    
    it "returns movies sorted by average stars in descending order" do
      sorted_movies = Movie.sorted_by_average_stars
      expect(sorted_movies).to eq([movie1, movie2])
    end
  end

end