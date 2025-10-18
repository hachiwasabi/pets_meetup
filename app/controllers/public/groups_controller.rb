class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :join_request, :approve, :reject]

  def index
    @groups = Group.all
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
    params.require(:group).permit(:name, :description)
  end
end
