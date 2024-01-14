class AddUniqueIndexToMovieActors < ActiveRecord::Migration[7.0]
  def change
    add_index :movie_actors, [:movie_id, :actor_id], unique: true
  end
end
