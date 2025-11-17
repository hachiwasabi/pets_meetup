class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def follows
    @user = User.find(params[:id])
    @users = @user.following_users.with_attached_profile_image.page(params[:page]).per(12)
    render :follows
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users.with_attached_profile_image.page(params[:page]).per(12)
    render :followers
  end

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

end
