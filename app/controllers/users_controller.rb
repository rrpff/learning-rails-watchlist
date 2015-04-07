class UsersController < ApplicationController

    def index
        @users = latest User.all
    end

    def show
        @user = User.find_by username: params[:id]
    end

end
