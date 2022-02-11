class RatingsController < ApplicationController

    helper_method :logged_in?, :current_user
    


    def new
        
        @rating = Rating.new(show_id: params[:show_id] )       
        
            
    end

    def create
        @rating = Rating.new(rating_params)
        
        redirect_to show_path(@rating.show_id)
    end


    private

        def rating_params
            params.require(:rating).permit(:score, :show_id)
        end

        
end
