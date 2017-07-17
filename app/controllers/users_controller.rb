class UsersController < ApplicationController
    before_action :set_user, only: [:show,:edit, :update]
    def create
        user = User.create(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to recipes_url
        else
            flash[:message] = user.errors.full_messages
            redirect_to new_session_url
        end
    end 
    
    def show
        
    end
    def edit
    end 
    
    def update
    end
    
    private
    def  user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end 
    
    def set_user
        @user = User.find(params[:id])
    end
    
    

end
