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
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
