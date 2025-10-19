class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def destroy
    @post.destroy!
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  rescue => e
    logger.error "Admin::PostsController#destroy error: #{e.message}"
    redirect_to admin_posts_path, alert: "投稿の削除に失敗しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
