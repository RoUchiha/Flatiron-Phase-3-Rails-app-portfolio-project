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


    def new
        @show = Show.new(user_id: params[:user_id])
    end


    private

        def show_params


end
