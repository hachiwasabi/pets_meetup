class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_comment, only: [:destroy]

  # 1. 一覧表示（ページネーションを入れる例もコメント）
  def index
    # 全コメントを新しい順で取得。大量データならページネーションを導入してください (kaminari/will_paginate等)
    @comments = Comment.includes(:user, :post).order(created_at: :desc).all
  end

  # 2. 管理者による削除（完全削除）
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
