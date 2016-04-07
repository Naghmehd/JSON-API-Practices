class Api::PostsController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    respond_with @post = Post.all
  end

  def show
    @post = set_post
    respond_with @post

    rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def new
    respond_with @post = Post.new
  end

  def create
    respond_with @post = Post.new(postname: params[:post][:postname])

  end

  def edit
    respond_with @post
  end

  def update
    @post = set_post
    @post.update(post_params)

    respond_with @post

    rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def destroy
    @post.destroy

    respond_with @post.destroy

    rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
    end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
      params.require(:post).permit(:title)
  end
end
