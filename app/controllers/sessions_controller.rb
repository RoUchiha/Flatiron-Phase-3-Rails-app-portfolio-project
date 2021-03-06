class SessionsController < ApplicationController

    helper_method :logged_in?, :current_user


    def new
        if logged_in?
            redirect_to user_path(current_user)
        end
    end


    def create 
        user = User.find_by(username: params[:session][:username].downcase)
       
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            flash[:alert] = "Incorrect username and/or password. Please try again."
            render :new 
        end
    end





    def destroy
        if logged_in?
            session.clear
            redirect_to '/'
        else
            redirect_back(fallback_location: root_path)
        end
    end

end