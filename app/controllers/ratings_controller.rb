class RatingsController < ApplicationController

    helper_method :logged_in?, :current_user
    


    def new
        
        @rating = Rating.new(show_id: params[:show_id] )       
        
        @show = Show.find_by(id: params[:show_id])
        
        
    end

    def create
        @show = Show.find_by(id: params[:show_id])
        @rating = Rating.new(rating_params)
        @review = Review.new
        @review.ratings << @rating 
        @review.shows << @show 

        if @rating.save 
            redirect_to show_path(@rating.show_id)
        else
            render 'shows/new'
        end
    end

    def edit 
        @show = Show.find_by(id: params[:show_id])
        @rating = @show.ratings.first 
    end

    def update 
        @show = Show.find_by(id: params[:show_id])
        @rating = @show.ratings.first 
        @rating.update(rating_params)
        if @rating.save 
            redirect_to show_path(@rating.show_id)
        else
            render 'shows/edit'
        end
    end


    private

        def rating_params
            params.require(:rating).permit(:score, :show_id, :review_id)
        end

        
end
