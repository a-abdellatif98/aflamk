# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  review     :text
#  stars      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reviews_on_movie_id  (movie_id)
#  index_reviews_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (user_id => users.id)
#
class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :stars, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end
