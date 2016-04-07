class Api::PostsController < ApplicationController
  respond_to :json

  def index
    respond_with @post = post.all
  end

  def show
    respond_with @post
  end

  def new
    respond_with @post = post.new
  end

  def create
    respond_with @post = post.new(postname: params[:post][:postname])
  end

  def edit
    respond_with @post
  end

  def update
    @post.update(post_params)

    respond_with @post
  end

  def destroy
    @post.destroy

    respond_with @post.destroy
  end

  private

  def set_post
    @post = post.find(params[:id])
  end

  def post_params
      params.require(:post).permit(:postname)
  end
end
