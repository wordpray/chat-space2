class MessagesController < ApplicationController
  def index
    @groups = current_user.groups if @groups.present?
  end
end
