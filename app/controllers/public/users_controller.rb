class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:mypage, :edit, :update, :withdraw, :show]
  before_action :ensure_correct_user, only: [:mypage, :edit, :update, :withdraw]

  def mypage
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    if @user == current_user
      redirect_to mypage_user_path(@user) and return
    end
  end

  def index
    @users = User.where(is_active: true).order(:name).page(params[:page]).per(10)
  end


  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_user_path(@user), notice: "プロフィールを更新しました。"
    else
      render :edit
    end
  end

  def withdraw
    @user = current_user
    @user.transaction do
      @user.owned_groups.destroy_all
      @user.update(is_active: false)
    end
    reset_session  
    redirect_to new_user_registration_path
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_correct_user
    redirect_to root_path, alert: "不正なアクセスです。" unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :pet_type, :pet_name, :bio)
  end
end
