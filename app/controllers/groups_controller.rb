class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = current_user.groups
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループが作成されました。'
    else
      redirect_to :back, alert: 'グループ作成に失敗しました。'
    end
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループ情報が更新されました。'
    else
      redirect_to :back, alert: 'グループ情報更新に失敗しました。'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
