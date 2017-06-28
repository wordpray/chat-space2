class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = current_user.messages.new(message_params)
    @message.save
    redirect_to group_messages_path(@group)
  end
end

private

def message_params
  params.require(:message).permit(:body, :image).merge(params.permit[:group_id])
end
