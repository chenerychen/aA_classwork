class ApplicationController < ActionController::Base

    # C current_user < - this sets instance variable to current user
    # R require_logged_in < - redirects to new session if !logged_in
    # R require_logged_out
    # L login!
    # L logged_in?
    # L logout!

    helper_method 

    def login!(user) 
        session[:session_token] = user.reset_session_token! 
    end  

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def logged_in? 
        !!current_user #!current_user.nil? ## true
    end  

    def logout!
        @current_user.reset_session_token!
        session[:session_token] = nil 
        @current_user = nil 
    end 

    def require_logged_in 
        redirect_to new_session_url if !logged_in? 
    end 

    def require_logged_out 
        redirect_to users_url if logged_in? 
    end 
end
