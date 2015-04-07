require 'rails_helper'

RSpec.describe Film, type: :model do

    describe 'instances' do

        it 'should be have a method for creating from a TMDB id' do
            @film = Film.create_from_tmdb_id 157336
            puts @film.to_json
            # @film.title.should === 'Interstellar'
        end

        it 'should have a title and a TMDB id' do
            @film = Film.create title: ''
            @film.save.should === false
        end

    end

end
