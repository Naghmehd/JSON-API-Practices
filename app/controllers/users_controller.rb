class UsersController < ApplicationController

  def index
    @user.User.all
  end

  def show
    @user = set_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.save
  end

  def edit
    @user = set_user
  end

  def  updated
    User.update(params[:id], user_params)
  end

  def destroy
    @user = set_user
    @user.destroy
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:username)
  end

end
