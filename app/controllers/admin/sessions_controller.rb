# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :check_empty_fields, only: [:create]

  def after_sign_in_path_for(resource)
    admin_users_path 
  end

  private

  def check_empty_fields
    if params[:admin][:email].blank? || params[:admin][:password].blank?
      flash.now[:alert] = "メールアドレスとパスワードを入力してください"
      self.resource = Admin.new(email: params[:admin][:email])
      render :new and return
    end
  end
  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

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
end
