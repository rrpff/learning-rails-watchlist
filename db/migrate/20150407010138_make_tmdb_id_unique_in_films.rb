class MakeTmdbIdUniqueInFilms < ActiveRecord::Migration
  def change
    add_index :films, :tmdb_id, unique: true
  end
end
