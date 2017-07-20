module LikesHelper
    def find_id (likes, user_id)
        likes.find{|like| like.user_id == @user.id}.id
    end
end