Here's the formatted README:

# Movie Search App

## Overview
This is a Ruby on Rails application that allows users to search for movies by actor's first name or full name. The movies are displayed in order of their average star rating.

## Prerequisites
- Ruby version 3.2.2
- Rails version 7.0.8

## Installation

1. Clone the repository:
```
git clone https://github.com/your-username/movie-search-app.git
```

2. Install dependencies:
```
bundle install
```

3. Set up the database:
```
rails db:create
rails db:migrate
```

4. Import the movie and review data:
```
rails import:movies
rails import:reviews
```

5. Start the Rails server:
```
rails server
```

6. Access the application in your browser:
```
http://localhost:3000/
```

## Features
- Search for movies by actor's first name or full name
- Movies are displayed in order of their average star rating
- Implemented Rspec test cases for models, controllers, services, and factories

## Running Tests
To run all the test cases:
```
rspec spec
```

You can also run tests for individual components:
```
rspec spec/models
rspec spec/services
rspec spec/requests
```

## Contributing
If you would like to contribute to this project, please feel free to submit a pull request.
