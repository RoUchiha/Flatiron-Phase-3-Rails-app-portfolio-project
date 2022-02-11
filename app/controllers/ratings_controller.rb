class RatingsController < ApplicationController

    helper_method :logged_in?, :current_user
    


    def new
        if params[:show_id]
            @rating = Rating.new(show_id: params[:show_id] )       
        end
            
    end

    def create
        @rating = Rating.new(rating_params)
  
        redirect_to show_path(@rating.show_id)
    end


    private

        def rating_params
            params.require(:rating).permit(:show_id, :score)
        end

        
end
