class UsersController < ApplicationController

  def index
    @user.User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.save
  end

  def edit
    @user = User.find(params[:id])
  end

  def  updated
    User.update(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

end
