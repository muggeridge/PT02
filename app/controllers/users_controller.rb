
class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end
    def new

    end
    def destroy 
        if User.find(params[:id]).destroy
            redirect_to users_path
        else
            redirect_to root_path
        end
    end
    def create
        @user = User.new(user_params)
        if( @user.save )
            redirect_to users_path
        else
            redirect_to root_path
        end
    end
    def user_params
        params.require(:user).permit(
            :last_name 
        )
    end
end