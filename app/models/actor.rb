# == Schema Information
#
# Table name: actors
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors
end
