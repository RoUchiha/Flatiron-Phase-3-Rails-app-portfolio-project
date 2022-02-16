class ShowsController < ApplicationController

    helper_method :logged_in?, :current_user

    def index
        @user = User.find_by(id: params[:user_id])
        if @user 
            @shows = @user.shows.uniq 
            flash[:title] = "All Your Shows"
        else
            @shows = Show.all 
            flash[:title] = "All Shows in Database"
        end
    end

    def show 
        session[:current_url] = 
        @show_user = User.find_by(id: params[:user_id])
        if @show_user
            
            @show = @show_user.shows.find_by(id: params[:id])
        else
            @show = Show.all.find_by(id: params[:id])
        end
    end


    def new
        if logged_in?
            @user = current_user
            @show = Show.new(user_id: params[:user_id])
        else
            flash[:alert] = "You must be logged in to create a new show!"
            redirect_to root_path
        end
    end

    def create
        @user = User.find_by(id: session[:user_id])
        @show = @user.shows.build(show_params)
        if @show.save 
            redirect_to user_show_path(@user, @show)
        else
            render :new
        end
    end

    def edit 
        @user = User.find_by(id: params[:user_id])
        if @user == current_user
            @show = Show.find_by(id: params[:id])
            @rating = @show.ratings.first
            @comment = @show.comments.first 
        else
            flash[:alert] = "You can't edit someone else's show!"
            redirect_to root_path
        end

    end


    def update
        @show = Show.find_by(id: params[:id])
        @show.update(show_params)
        
        if @show.save 
            redirect_to show_path(@show)
        else
            render :edit
        end
    end

    def destroy
        @show = Show.find_by(id: params[:id])
        @show.destroy
        redirect_to user_shows_path(current_user)
    end


    private

        def show_params
            params.require(:show).permit(:name, :genre, :episodes, :status, :user_id)
        end


end
