class UsersController < ApplicationController
    def index
        users = User.all
        render json: UserSerializer.new(users)
    end
    def new
        @user = User.new()
    end

    def create
        @user = User.create(user_params)
    end

    def update
        @user = User.find_by(params[:id])
        @user.update(user_params)
    end

    def delete
        User.find_by(params[:id]).delete()
    end 

    private 
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :username)
        end

end
