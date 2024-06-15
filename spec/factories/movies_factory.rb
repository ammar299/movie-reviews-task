FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    year { Faker::Number.between(from: 1900, to: 2023) }
    director { [Faker::Name.name] }
    filming_locations { [Faker::Address.city] }
    actors { Faker::Movies::HarryPotter.character.split(', ') }
    country { [Faker::Address.country] }
  end
end