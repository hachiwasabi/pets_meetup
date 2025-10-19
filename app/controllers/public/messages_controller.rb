class Public::MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def create
    if @group.group_members.approved.exists?(user_id: current_user.id) || @group.owner_id == current_user.id
      @message = @group.messages.build(message_params)
      @message.user_id = current_user.id
      @message.save
    else
      flash[:alert] = "このグループに参加していないため、メッセージを送信できません。"
    end
    redirect_to group_path(@group)
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
