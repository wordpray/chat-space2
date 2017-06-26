class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def edit
    @group = Group.new
  end
  
end
