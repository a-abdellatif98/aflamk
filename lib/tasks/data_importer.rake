namespace :data_importer do
  desc 'Importing data such as movies and reviews from CSV files'
  task data: :environment do
    require 'csv'

    def import_from_csv(file_name, &block)
      CSV.foreach(Rails.root.join('lib', 'data', file_name), headers: true, &block)
    end

    def find_or_create_resource(model, name)
      model.find_or_create_by(name: name)
    end

    def add_associations(movie, data)
      { 'Actor' => 'Actor', 'FilmingLocation' => 'Filming location', 'Country' => 'Country' }.each do |model, field|
        resource = find_or_create_resource(model.constantize, data[field])
        association = model.tableize.singularize
        movie.send(association.pluralize) << resource unless movie.send(association.pluralize).exists?(resource.id)
      end
    end    

    def import_movies
      import_from_csv('movies.csv') do |row|
        data = row.to_h
        movie = find_or_create_resource(Movie, data['Movie'])
        movie.assign_attributes(
          director: find_or_create_resource(Director, data['Director']),
          description: data['Description'],
          year: data['Year']
        )
        movie.save if movie.changed?
        add_associations(movie, data)
      end
    end

    def import_reviews
      import_from_csv('reviews.csv') do |row|
        data = row.to_h
        Review.create!(
          movie: find_or_create_resource(Movie, data['Movie']),
          user: find_or_create_resource(User, data['User']),
          stars: data['Stars'],
          review: data['Review']
        )
      end
    end

    import_movies
    import_reviews
  end
end
