class LikesController < ApplicationController
    before_action :set_like, only:[:delete]
    def create
        puts params
        Like.create(user_id: current_user.id, recipe_id: params[:recipe_id])
        redirect_to(:back)
    end
    
    def delete
        @like.destroy
        redirect_to(:back)
    end
    
    private
    def set_like
        @like = Like.find(params[:id])
    end
end