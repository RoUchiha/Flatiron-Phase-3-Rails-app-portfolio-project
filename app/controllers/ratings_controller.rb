class RatingsController < ApplicationController

    helper_method :logged_in?, :current_user
    


    def new
        
        @rating = Rating.new(show_id: params[:show_id] )       
        
        @show = Show.all.find_by(id: params[:show_id])
    end

    def create
        @show = Show.all.find_by(id: params[:show_id])
        @rating = Rating.new(rating_params)

        if @rating.save 
            redirect_to show_path(@rating.show_id)
        else
            render :new 
        end
    end


    private

        def rating_params
            params.require(:rating).permit(:score, :show_id)
        end

        
end
