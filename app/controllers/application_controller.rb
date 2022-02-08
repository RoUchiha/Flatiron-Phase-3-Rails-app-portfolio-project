class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @user = User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def login_needed
        unless logged_in?
            flash[:alert] = "You must be logged in to access this page!"
            redirect_to root_path           
        end
    end


end
