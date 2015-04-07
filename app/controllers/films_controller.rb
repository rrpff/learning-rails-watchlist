class FilmsController < ApplicationController

    before_filter :authenticate!
    around_filter :current_user_has_permission

    def create
        @list = List.find params[:list_id]
        @film = @list.films.create_from_tmdb_id film_params[:tmdb_id]

        render json: @film.to_json
    end

    def destroy
        @list = List.find params[:list_id]
        @film = @list.films.find film_params[:id]

        render json: @list.delete(@film)
    end

    private

    def film_params
        params.require(:film)
            .permit(:id, :tmdb_id)
    end

    def current_user_has_permission
        @list = List.find params[:list_id]

        if !current_user and current_user.id != @list.user.id
            render json: { error: 'You do not have permission to do that.' }
        end

        yield
    end

    # def show
    #     id = params[:id]
    #     @film = Film.find_by(tmdb_id: id) || Film.create_by_tmdb_id(id)

    #     redirect_to(root_path, notice: "File #{id} cannot be found.") unless @film
    # end

    # def search
    #     @films = TMDB::Movie.search params[:query]
    #     render json: @films.to_json
    # end

end