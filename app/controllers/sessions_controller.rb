class SessionsController < ApplicationController

    def create
        auth = request.env['omniauth.auth']
        user = User.find_by(uid: auth['uid']) || User.create_from_auth(auth)

        if user
            session[:user_id] = user.id
            redirect_to root_path,
                success: "Welcome, @#{user.username}"
        else
            redirect_to root_path,
                error: 'Could not authenticate.'
        end
    end

    def destroy
        session[:user_id] = null
        redirect_to root_path,
            notice: 'Ciao!'
    end

end