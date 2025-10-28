class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group, only: [:show, :destroy, :remove_member]

  def index
    @groups = Group.all.includes(:owner).page(params[:page])
  end

  def show
    @group_members = @group.group_members.includes(:user)
  end

  def destroy
    @group.destroy
    redirect_to admin_groups_path, notice: "グループを削除しました"
  end

  def remove_member
    member = @group.group_members.find(params[:member_id])
    member.destroy
    redirect_to admin_group_path(@group), notice: "#{member.user.name}をグループから削除しました"
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end
  
end
