class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create, :destroy]
  before_action :set_follow, only: [:follows, :followers]

  def follows
    @users = @user.following_users.with_attached_profile_image.page(params[:page]).per(12)
    render :follows
  end

  def followers
    @users = @user.follower_users.with_attached_profile_image.page(params[:page]).per(12)
    render :followers
  end

  def create
    current_user.follow(params[:user_id])
  end

  def destroy
    current_user.unfollow(params[:user_id])
  end

  private

  def set_follow
    @user = User.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
  
end
