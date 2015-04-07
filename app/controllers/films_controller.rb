require 'uri'
require 'open-uri'

class FilmsController < ApplicationController

    before_filter :authenticate!, :current_user_has_permission,
        except: ['search']

    def create
        @list = List.find params[:list_id]
        @film = @list.films.create_from_tmdb_id film_params[:tmdb_id]

        render partial: 'films/film', locals: { list: @list, film: @film }
    end

    def destroy
        @list = List.find params[:list_id]
        @film = @list.films.find film_params[:id]

        render json: @list.delete(@film)
    end

    def watch
        @list = List.find params[:list_id]
        @film = @list.films.find params[:id]

        unless current_user.has_seen?(@film)
            @film.watcheds.create user_id: current_user.id
        end

        redirect_to @list.user
        render json: @film
    end

    def unwatch
        @list = List.find params[:list_id]
        @film = @list.films.find params[:id]

        @watched = @film.watcheds.find_by user_id: current_user.id
        @watched.destroy

        redirect_to @list.user
        render json: @film
    end

    def search
        key = TMDB::API.api_key
        url = URI.parse "http://api.themoviedb.org/3/search/movie"
        url.query = URI.encode_www_form api_key: key,
            query: URI.encode(params[:query])

        render json: url.open.read
    end

    private

    def film_params
        params.require(:film).permit(:id, :tmdb_id)
    end

    def current_user_has_permission
        @list = List.find params[:list_id]

        unless current_user and current_user.id === @list.user.id
            render json: { error: 'You do not have permission to do that.' }
        end

    end

    # def show
    #     id = params[:id]
    #     @film = Film.find_by(tmdb_id: id) || Film.create_by_tmdb_id(id)

    #     redirect_to(root_path, notice: "File #{id} cannot be found.") unless @film
    # end

end