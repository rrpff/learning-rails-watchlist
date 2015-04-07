require 'rails_helper'

RSpec.describe List, type: :model do

    before :each do
        @list = List.new
    end

    describe 'instances' do

        it 'should have a method which adds films using TMDB IDs' do
            @list.add_film 168259
            @list.films.length.should === 1
        end

        it 'should not allow duplicate films' do
            first = @list.add_film 168259
            second = @list.add_film 168259

            @list.films.length.should === 1
            first.should_not === second
            second.should === nil
        end

    end

end
