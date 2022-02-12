class CommentsController < ApplicationController

    helper_method :logged_in?, :current_user


    def new
        @user = current_user 
        @show = Show.find_by(id: params[:show_id])
        @comment = Comment.new(show_id: params[:show_id], user_id: current_user.id)
       
    end

    def create 
        @user = current_user
        @show = Show.find_by(id: params[:show_id])
        @comment = Comment.new(comment_params)
       

        if @comment.save 
            redirect_to show_path(@show)
        else
            render :new
        end
    end

    def edit 
        @user = current_user
        @show = Show.find_by(id: params[:show_id])
        @comment = @show.comments.first 
    end

    def update 
        @user = current_user
        @show = Show.find_by(id: params[:show_id])
        @comment = @show.comments.first 
        @comment.update(comment_params)
        if @comment.save 
            redirect_to show_path(@show)
        else
            render 'shows/edit'
        end
    end


    private 

        def comment_params
            params.require(:comment).permit(:content, :user_id, :show_id )
        end


end
