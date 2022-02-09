class ShowsController < ApplicationController

    helper_method :logged_in?, :current_user

    def index
        @user = User.find_by(id: params[:user_id])
        if @user 
            @shows = @user.shows.uniq 
        else
            @shows = Show.all 
        end
    end

    def show 
        @user = User.find_by(id: params[:user_id])
        if @user
            @show = @user.shows.find_by(id: params[:id])
        else
            @show = Show.all.find_by(id: params[:id])
        end
    end


    def new
        if logged_in?
            @show = Show.new(user_id: params[:user_id])
        else
            flash[:alert] = "You must be logged in to create a new show!"
            redirect_to root_path
        end
    end

    def create

    end


    private

        def show_params
            params.require(:show).permit(:name, :genre, :episodes, :status, :user_id)
        end


end
