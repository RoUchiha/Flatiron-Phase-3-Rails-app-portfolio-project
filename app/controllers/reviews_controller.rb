class ReviewsController < ApplicationController

    def new 
        @show = Show.find_by(id: params[:show_id])

        @review = Review.find_by(id: @show.ratings.first.review.id)
    end

    def create 
        @show = Show.find_by(id: params[:show_id])
        @review = Review.find_by(id: @show.ratings.first.review.id)
        @review.update(review_params) 
        
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
