class UsersController < ApplicationController
  def search_params
    params.require(:search_person).permit(:area, :name, :cargo)
  end

  # GET /users
  def index
    @users = User.search(search_params)
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end
end
