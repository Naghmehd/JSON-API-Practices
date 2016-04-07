class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


    def new
      @post = Post.new
    end

    def create
      @post = Post.new
      @post.body = params[:post][:body]
      @post.title = params[:post][:title]
      @post.save
    end

    def editing
      @post = Post.find(params[:id])
    end

    def  updated
      @post = Post.find(params[:id],post_params)
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
    end

  private

  def post_params
    params.require(:post).permit(:body, :title)
  end

end
