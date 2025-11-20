class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :join_request, :approve, :reject, :edit, :update, :destroy]

  def index
    @groups = Group.all.page(params[:page])
  end

  def show
    @pending_members = @group.group_members.pending if @group.owner_id == current_user.id
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to @group, notice: "グループを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "グループ情報を更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, alert:"グループを削除しました"
  end

  def join_request
    unless @group.group_members.exists?(user_id: current_user.id)
      @group.group_members.create(user_id: current_user.id, status: :pending)
    end
    redirect_to @group, notice: "参加申請を送りました"
  end

  def approve
    member = @group.group_members.find(params[:member_id])
    member.update(status: :approved)
    redirect_to @group, notice: "参加を承認しました"
  end

  def reject
    member = @group.group_members.find(params[:member_id])
    member.update(status: :rejected)
    redirect_to @group, alert: "参加を拒否しました"
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :description, :image)
  end
end
