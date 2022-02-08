class UsersController < ApplicationController

    helper_method :logged_in?, :current_user
    
    def new
        if logged_in?
            redirect_to user_shows_path(current_user)
        else
            @user = User.new
        end
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_shows_path(@user)
        else
            render :new 
        end
    end

    def show

    end

    def edit

    end

    


    private

        def user_params
            params.require(:user).permit(:username, :full_name, :email, :password, :password_confirmation)
        end

        def auth 
            request.env['omniauth.auth']
        end

end
