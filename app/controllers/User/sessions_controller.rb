# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
      token = encode({user_id: @user.id})
      render json: {
      authenticated: true,
      message: "You are logging in...",
      user: UsersSerializer.new(@user),
      token: token
    }, status: :accepted
  end
  

  # DELETE /resource/sign_out
  def destroy # Assumes only JSON requests
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render :json => {
        'csrfParam' => request_forgery_protection_token,
        'csrfToken' => form_authenticity_token
    }
  end
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
    end
end
