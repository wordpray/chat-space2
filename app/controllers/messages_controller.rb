class MessagesController < ApplicationController
  before_action :set_projects, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to  group_messages_path(@group), notice: '投稿しました。'
    else
      flash.now[:alert] = "メッセージを入力して下さい。"
      render :index
    end
  end
end

private

def message_params
  params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
    binding.pry
end

def set_projects
  @group = Group.find(params[:group_id])
  @groups = current_user.groups
  @users = @group.users
  @messages = @group.messages.includes(:user)
end
