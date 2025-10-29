class Admin::UsersController < ApplicationController
 before_action :authenticate_admin!
 before_action :set_user, only: [:show, :withdraw, :update]

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def withdraw
    ActiveRecord::Base.transaction do
      @user.owned_groups.destroy_all
      if @user.update(is_active: false)
        flash[:notice] = "退会処理を行いました。"
      else
        raise ActiveRecord::Rollback, "ユーザーの退会更新に失敗しました。"
      end
    end
    redirect_to admin_users_path
    rescue => e
      flash[:alert] = "退会処理に失敗しました。"
      redirect_to admin_users_path
  end


  private

  def set_user
    @user = User.find(params[:id])
  end
end
