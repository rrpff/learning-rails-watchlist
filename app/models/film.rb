class Film < ActiveRecord::Base

    belongs_to :list

    validates :tmdb_id, :title, :rating,
        presence: true

    def self.create_from_tmdb_id(id)

    end

end