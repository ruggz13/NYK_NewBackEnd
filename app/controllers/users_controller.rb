require 'byebug'

class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, except: [:created_at, :updated_at]
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
