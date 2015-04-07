class Film < ActiveRecord::Base

    belongs_to :list
    has_many :watcheds, as: :watchable

    validates :tmdb_id, :title,
        presence: true

    def self.create_from_tmdb_id(id)
        # Find if it already exists
        search = Film.find_by(tmdb_id: id)
        return search if search

        film = TMDB::Movie.id(id)

        Film.create tmdb_id: film.id,
            title: film.title,
            rating: film.vote_average.to_s
    end

end