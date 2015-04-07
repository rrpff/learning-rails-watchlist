class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    helper_method :user_signed_in?,
        :current_user,
        :authenticate!,
        :latest

    private

    # Mock some devise helpers
    def user_signed_in?
        !!session[:user_id]
    end

    def current_user
        user_signed_in? ? User.find(session[:user_id]) : nil
    end

    def authenticate!
        redirect_to '/auth/twitter' unless user_signed_in?
    end

    def latest(query)
        query.order('created_at DESC').limit(25)
    end
end