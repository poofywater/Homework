class ApplicationController < ActionController::Base
    protection_from_forgery with: :exception
    helper_method :current_user
    helper_method :logged_in?
    #C E L L L 
    private
    def require_no_user!
        redirect_to user_url if current_user
    end

    def current_user                #C
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def ensure_logged_in!           #E
        redirect_to new_session_url if current_user.nil?
    end

    def login_user!(user)           #L
        session[:session_token] = User.reset_session_token!
    end

    def logout_user!                #L
        current_user.reset_session_token!
        session[:session_token] = nil
    end

    def logged_in?                  #L
        !!current_user
    end



end
