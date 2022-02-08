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
        @user = current_user
        if logged_in?
            if @user == User.find_by(id: params[:id])
                render :show 
            else
                flash[:alert] = "You cannot access another user's settings!"
                redirect_to user_shows_path(@user)
            end
        else
            redirect_to root_path
        end
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
