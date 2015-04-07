class ListsController < ApplicationController

    def show
        @list = List.find_by params[:id]
        render json: @list.films.to_json
    end

end
