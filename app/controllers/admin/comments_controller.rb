class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_comment, only: [:destroy]

  def index
    @comments = Comment.includes(:user, :post).order(created_at: :desc).page(params[:page])
  end

  def destroy
    @comment.destroy!
    redirect_to admin_comments_path, notice: "コメントを削除しました"
  rescue => e
    logger.error "Admin::CommentsController#destroy error: #{e.message}"
    redirect_to admin_comments_path, alert: "コメントの削除に失敗しました"
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
