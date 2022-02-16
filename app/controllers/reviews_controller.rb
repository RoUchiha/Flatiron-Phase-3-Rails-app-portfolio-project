class ReviewsController < ApplicationController

    def new 
        @review = Review.new 
        @show = Show.find_by(id: params[:show_id])
    end

    def create 
        @show = Show.find_by(id: params[:show_id])
        @review = Review.new(review_params)
        @rating = @show.ratings.first 
        @rating.review_id = @review.id  
        
        if @review.save 
            redirect_to show_path(@show)
        else
            render 'shows/new'
        end
    end

    private 

        def review_params
            params.require(:review).permit(:yes_no)
        end


end
