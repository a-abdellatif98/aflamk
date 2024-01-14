# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :bigint           not null
#
# Indexes
#
#  index_movies_on_director_id  (director_id)
#
# Foreign Keys
#
#  fk_rails_...  (director_id => directors.id)
#
class Movie < ApplicationRecord
  include Filtering

  
  belongs_to :director
  has_many :reviews

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :movie_filming_locations
  has_many :filming_locations, through: :movie_filming_locations

  has_many :movie_countries
  has_many :countries, through: :movie_countries


  scope :with_average_ratings, -> (rate) {
    select('movies.*, COALESCE(AVG(reviews.stars), 0) AS average_stars')
      .joins('LEFT JOIN reviews ON reviews.movie_id = movies.id')
      .group('movies.id')
      .having('COALESCE(AVG(reviews.stars), 0) >= ?', rate)
  }
  
  scope :filter_by_sort_rating, lambda { |rate, order = 'DESC'|
    order = ['ASC', 'DESC'].include?(order.upcase) ? order.upcase : 'DESC'
    with_average_ratings(rate).order(Arel.sql("average_stars #{order}"))
  }
  
  scope :filter_by_actor, ->(actor) { joins(:actors).where('actors.name ILIKE ?', "%#{actor}%").distinct }


end
