class UsersController < ApplicationController

    helper_method :logged_in?, :current_user
    
    def index
        if logged_in?
            @users = User.all 
        else
            flash[:alert] = "You must be logged in to view that page!"
            redirect_to root_path
        end
    end



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
            redirect_to user_path(session[:user_id])
        else
            render :new 
        end
    end

    def show
        @show_user = User.find_by(id: params[:id])
        @recent_show = current_user.shows.finished.most_recent

        if logged_in?
            render :show 
        else
            flash[:alert] = "You must be logged in to view that page!"
            redirect_to root_path
        end
    end

    def github_login
        @user = User.find_by(username: auth[:info][:nickname])

        if @user.nil?
            @user = User.new(
                username: auth[:info][:nickname],
                full_name: auth[:info][:name],
                password: SecureRandom.uuid
            )
        end
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(session[:user_id])
        else
            render :new 
        end
    end

    def edit
        @edit_user = User.find_by(id: params[:id])
        if @edit_user == current_user
            render :edit 
        else
            flash[:alert] = "You can't edit someone else's account!"
            redirect_to root_path 
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        if @user.save 
            redirect_to user_path(session[:user_id])
        else
            render :edit 
        end
    end


    private

        def user_params
            params.require(:user).permit(:username, :full_name, :email, :password, :password_confirmation)
        end

        def auth 
            request.env['omniauth.auth']
        end

end
