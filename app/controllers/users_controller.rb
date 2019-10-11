require 'byebug'

class UsersController < ApplicationController
    def index
        users = User.all
        user_signed_in?
        render json: current_user include: [:user_session]
    end
    def new
        @user = User.new()
    end

    def create
        user = User.create!(user_params)
        render json: user
          
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
            params.require(:user).permit(:id, :first_name, :last_name, :email, :password, :username)
        end

end
