class Film < ActiveRecord::Base

    belongs_to :list

    validates :tmdb_id, :title, :rating,
        presence: true

    def self.create_from_tmdb_id(id)
        film = TMDB::Movie.id id

        Film.create tmdb_id: film.id,
            title: film.title,
            rating: film.vote_average.to_s
    end

end