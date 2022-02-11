class RatingsController < ApplicationController

    helper_method :logged_in?, :current_user, :current_show



    def new
        @show = current_show
        @rating = Rating.new(show_id: @show.id )
        
    end

    def create
        @show = current_show
        @rating = @show.rating.build(rating_params)
        if @rating.save 
            redirect_to user_show_path(current_user, @show.id)
        else 
            render :
    end


    private

        def rating_params
            params.require(:rating).permit(:show_id, :score)
        end

        def current_show
            @show = Show.find_by(id: params[:id])
        end

end
