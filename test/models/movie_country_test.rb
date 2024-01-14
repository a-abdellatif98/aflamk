# == Schema Information
#
# Table name: movie_countries
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :bigint           not null
#  movie_id   :bigint           not null
#
# Indexes
#
#  index_movie_countries_on_country_id  (country_id)
#  index_movie_countries_on_movie_id    (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (country_id => countries.id)
#  fk_rails_...  (movie_id => movies.id)
#
require "test_helper"

class MovieCountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
