# aflamk App

## About

This assignment is about writing a small Ruby On Rails application. Use a methodology that works for you or that you are used to.

1. Create a new application with Ruby on Rails

2. Study the content of movies.csv and reviews.csv

3. Define a database schema and add it to your application

4. Write an import task to import both CSV-files

5. Show an overview of all movies in your application

6. Make a search form to search for an actor

7. Sort the overview by average stars (rating) in an efficient way

Design CSV importer/application for heavy data processing

## How to run

```ruby
bundle install
```

* init rails env & ruby 3.2.2

```ruby
rake db:create && rake db:migrate
```

- to import Data

```ruby
rake data_importer:data
```
