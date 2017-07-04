class UsersController < ApplicationController
  def index
    @users = User.search_users(params[:keyword])
    respond_to do |format|
      format.json{
        render "groups/new", json: User.search_users(params[:keyword])
      }
    end
  end

  private

  def search_params
    params.require(:keyword)
  end
end
