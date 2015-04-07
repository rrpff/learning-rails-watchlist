class List < ActiveRecord::Base

    belongs_to :user
    has_many :films

    def add_film(tmdb_id)
        film = Film.find_by(tmdb_id: tmdb_id) || Film.create_from_tmdb_id(tmdb_id)

        return nil if !film || self.films.find_by(film.id)
        self.films << film
    end

end