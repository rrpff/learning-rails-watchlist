class UsersController < ApplicationController

    def show
        @user = User.find_by username: params[:id]
        unless @user
            redirect_to root_path,
                alert: "@#{params[:id]} not found"
        end
    end

end