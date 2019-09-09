class V1::SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
            flash[:notice] = "No User found with that name / password"
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end 
end