FactoryBot.define do
  factory :review do
    user { Faker::Name.name }
    stars { Faker::Number.between(from: 1, to: 5) }
    movie
  end
end