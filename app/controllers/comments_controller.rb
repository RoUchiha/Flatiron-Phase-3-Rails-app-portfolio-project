class CommentsController < ApplicationController

    def new
        @show = Show.find_by(id: params[:show_id])
        @comment = Comment.new(show_id: params[:show_id])
        @user = current_user 
    end

    def create 
        @show = Show.find_by(id: params[:show_id])
        @comment = Comment.new(comment_params)
        @user = current_user

        if @comment.save 
            redirect_to show_path(@show)
        else
            render :new
        end
    end


    private 

        def comment_params
            params.require(:comment).permit(:content, :user_id, :show_id )
        end


end
