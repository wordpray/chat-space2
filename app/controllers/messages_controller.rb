class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(1)
  end
end
