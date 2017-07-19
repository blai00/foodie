class CommentsController < ApplicationController
    before_action :set_comment, only: [:delete]
    def create
        Comment.create(content: params[:content], recipe_id: params[:recipe_id], user_id: current_user.id)
        redirect_to recipe_url(params[:recipe_id])
    end 
    
    def delete
        @comment.destroy
        redirect_to(:back)
    end
    
    private
    def set_comment
        @comment = Comment.find(params[:id])
    end 
end
