class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    if @post.user_id == current_user.id
      redirect_to post_path(@post), alert: "自分の投稿にはコメントできません"
      return
    end
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @post = @comment.post
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
