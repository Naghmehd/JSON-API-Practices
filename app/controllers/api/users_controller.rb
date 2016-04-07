class Api::UsersController < ApplicationController
  respond_to :json

  def index
    respond_with @user = User.all
  end

  def show
    respond_with @user
  end

  def new
    respond_with @user = User.new
  end

  def create
    respond_with @user = User.new(username: params[:user][:username])
  end

  def edit
    respond_with @user
  end

  def update
    @user.update(user_params)

    respond_with @user
  end

  def destroy
    @user.destroy

    respond_with @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:username)
  end
end
