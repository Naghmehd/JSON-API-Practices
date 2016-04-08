class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    @user = User.all
    respond_with(@user)
  end

  def show
   @user = User.find(params[:id])
   respond_with @user, :include => :posts
    rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def new
    @user = User.new
    respond_with @user = User.new
  end

  def create
    @user = User.new
    respond_with @user = User.new(username: params[:user][:username])
  end

  def edit
    @user = set_user
    respond_with @user
  end

  def update
    @user = set_user
    @user.update(user_params)

    respond_with @user

    rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end


  def destroy
    @uer = set_user
    @user.destroy

    respond_with @user.destroy

    rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:username)
  end


end
